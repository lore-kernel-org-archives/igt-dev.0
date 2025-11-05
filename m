Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0641CCFA0D
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 17:39:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4203B10E1ED;
	Wed,  5 Nov 2025 17:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ml3MToPw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AD110E1ED
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 17:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762364372; x=1793900372;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Oruo5xihYEvJvz0g3ZJs1kqSsTSBUp39GAOtp0M7u00=;
 b=Ml3MToPw8R46DsW/zeOBIQQj3SdWcqSVl6ztSFXtF29rnAi5j+bOhN33
 w0ZDseFhSGwMSxlTW6bmQfvpyKxB7i1q5p4PpbAAg5cSQYnGFVEc4TqPF
 GZYHr2BIyfD3yL1DFSFLZY1+3Qz6WlnGO2/DaSYckYmUPODnCYQDGvL+D
 SfpijkY5TZA4JDIFZvHjnxSa5Ob89c8x7J8F2OnAc45Ft3mvWJBC/JITq
 fSWwdaddRZYON6GsuTBfZarDRuDG+xrsNOBE7JWrkh4HFotyK7j7cC2OE
 cHjvFyCePRHA1YO/IW63kPSdKFCdwGsxmE8NLm1tjzvixHESC1d5yx8JA g==;
X-CSE-ConnectionGUID: KZPZLwcoRwOT54Y3lpL4DA==
X-CSE-MsgGUID: C8Aq1SKvT+K5MJm7IaMflA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64394922"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64394922"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 09:39:31 -0800
X-CSE-ConnectionGUID: 6MdnrSEgRXWmGmnbf6CmoA==
X-CSE-MsgGUID: iBO1i3uWQjCqmSuNp0uT1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="186770836"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 09:39:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 09:39:30 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 09:39:30 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 09:39:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pb0oKxg2CNiV7+b7dxaq3YwwtORIhkK7vKSEIpTOwkdL5a1txXsaFey66M5R6peOF8ajWqHDowNNVkey8gDQcTVse/pL7OWDopqRO0qzyyVpKNIDRsdfF2yzyvhhk8PgoO1Z4mYBZN4oOYhO2QpJN3sTUyH82ZA06eNWi6isZjtGb0Z2ou7rQjOEqMqcQ1MaKyZMMbV4syKl5lqvned4SwFoTziL/XmPJDDJAGTuJ1BjJuzzgo09L4/YPgbF34iPi/RGyyWM5ryTKvSNfl4axy9kNup44UFFY8RHlOoVl3A/Cdacse998KEtafaGcX5aWKAjqseWvkcpmTQYXxwXNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8E3AYZFouArCu7UMiZDK1fsGhYWhYM0YgldUnJVrvA=;
 b=evvpScn3yIFoKqFCeoQ0D4afhcPY3ZJvPhgE+j+M6yzPUFlORQHEnhiCLr6VgAzO7cNvH/jYQFsQPp9zObTQ+Qtk5qmZp3oUocA/Yc9UWpXEnMDc24toZeAud/USH3cHMM7Ze+2yfflrf7P+eipp3DFBxMcUZWcmWdC9rpsTTub4Mk+6IyTWKJrZMAhWeWlDODXR7eOCyhfxEGmQ/5Bhxb9wqpAkd4TeH9kgXVlX1uv8xAegL44JQdQupdkp/9m0FwgozqGwBoX+WLBbiMlLxzGyBM2TtncGD/PwkBk7VOkQAkpST72kSw+OLnSqNbgIgGV74+WiLDS3907/E/HqdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB5910.namprd11.prod.outlook.com (2603:10b6:303:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Wed, 5 Nov
 2025 17:39:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 17:39:26 +0000
Date: Wed, 5 Nov 2025 09:39:24 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFp?= =?utf-8?Q?lur?=
 =?utf-8?Q?e?= for tests/kms_atomic_transition: Fix dynamic subtest (rev2)
Message-ID: <20251105173924.GC3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251030191558.206251-1-ngai-mint.kwan@linux.intel.com>
 <176191312385.4069.16233615779243640572@10055242dc62>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176191312385.4069.16233615779243640572@10055242dc62>
X-ClientProxiedBy: BY3PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:217::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: bf229405-c1ff-47a9-32d5-08de1c9243fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E9h0laCXUWqER57nCP0m9aoYAddReePpXotXcqC4m7qgzLtQqS0SsmW3nJQ6?=
 =?us-ascii?Q?4LHU6uRLf+ieE2hQVPR6tPGGvWDM3H8DpA0X7SA4Rz8QHyDxcKs+qg62zcKT?=
 =?us-ascii?Q?SDhRBZ8VPdgGZ3ulkhDNL9bBUcDMgq39kYXfbIB+gFIxhZVZCD9CN7j5Sr1Z?=
 =?us-ascii?Q?as4eIzuT9GII8jeDkr/rtDFKyt/L3pKCxwIoA44C6py8h+yMDk9lId46JLCq?=
 =?us-ascii?Q?Qc2Gc+p5v+kdFVgl5QGBMG1YsvrDzEsssxCLnPDnwuZbFK3dGyVGIoqXaNfY?=
 =?us-ascii?Q?NRIGzf9q9ImBEch+T61vRPVdhGGg3t6LIews8UC4gNsq/wGtvT2qGUrdEI4H?=
 =?us-ascii?Q?NJyQbAgqKATx8OaoV8yH7OT7iLzZQnaf5HnnFsbV6Vz0Q+ve1/dJMA4yEBr7?=
 =?us-ascii?Q?EHAG+3UY2GqsW/qsA1b3FkaqIZNXwn1SMyYuPerLEthCX9+STtnCY6smjYe8?=
 =?us-ascii?Q?v0LDYvcVEE/nQoBAFwJD4RPHIKtUEKUaR5SQp8+tJPDlaRFNUMqMSe3qLPT+?=
 =?us-ascii?Q?9TG+4WWQknNg0vqXo02FIBjVXxKTGA8tzdVxob0U/E6R9SIlD/wb8UkMwsj1?=
 =?us-ascii?Q?TxUVXE1aBJYDZNoGuTl54oAH84Wrj+LwF14rGvurMDWjs5IEp/rB1KrP/r2m?=
 =?us-ascii?Q?1PG7f7yld9lzXLDQJHINGm6qSIB0UypctL+xL9ibDR6BNLQ8P5lZ29Wwmk4K?=
 =?us-ascii?Q?tRqkv13ztDQ59U+Y0bEPnnF2XJRkYaT+aPFTmrwGeKWIpclv3b733geITpOf?=
 =?us-ascii?Q?5AeRM25PGrSd0heme3wnGGoOmOZkfezcpjN+24oJQoEYEadb1Ltxi+pZ/0CC?=
 =?us-ascii?Q?cNi1JGTryMfEhUziAtq8cupazknJDYoM0v13oF3ESQyEkyPq7iiM+dlh9Zc9?=
 =?us-ascii?Q?EOhBZ/vQa1RiMMR7fBfGthC0puy680FtVHKjbF/V3JtzBGLPAUV5R89YyWSP?=
 =?us-ascii?Q?RfoFiuUtgME38uzTOwx8OoxOSDHZPEHOYDA2ilUbE63F1DBOfXLPWWRYxQqZ?=
 =?us-ascii?Q?TKMaf9+A6dVPotbgbuzSymUjzfkLaKeO5uqMRWO6Mo6vDs4BgJewnZQZNRE4?=
 =?us-ascii?Q?640YNSe/QAfyAGZutjmpD+pLl50g0ulFlhGmXNh0TMIvMLim09K7lYqeq7xK?=
 =?us-ascii?Q?VJaq6AG9h/MN11WspZhwTKaRjAPXukKcWqgyoNg0Bf4CMsx9JrdmeS3Z+IxE?=
 =?us-ascii?Q?on25OLpykmwDGu2IUS5zTVdJIGA5+5NwZNJ4xir6jYCwrVaLAr/0Ryqz5IqJ?=
 =?us-ascii?Q?oTJ8p5AJqIKlDoIBt6ILXCiSwXsnSo4wtgCs0PBVImEbvvruqlg+YHuHfCJV?=
 =?us-ascii?Q?uq7i/S7lNQT1u4jDu1O8+P7RHnLmdYUunSeLqPD0YXOjBeipOrluPRw1xAXT?=
 =?us-ascii?Q?pqXRN7t/IkJgUOhnmKSw8LtwERlW6WyYiskKK3jy370kiYKcmg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8FE8kzF/sht1GBNgVRTSwhXc5fJ05ZGVVzeOIuANOj1MQOBfRFfpRRowOw1R?=
 =?us-ascii?Q?YWwtTB7kFKs35Vn9+D8dl29scN65XMmrCo+MHnCBJznL6P+n5yWYtod3LIwL?=
 =?us-ascii?Q?EE8iBfz1DWKAibg5lFAPXTFHawIVcatR08dxCDg53+2YdkjJOs03zctu2NFm?=
 =?us-ascii?Q?UnLMk/9hpMjGCQqtHWJxtBJFK6qwdimv8xdlpkgvWAKEgUqghqiKeIL/JE80?=
 =?us-ascii?Q?J+sCnikTlJquJ+/i/sEQLikdn61VB+NjiKTXbYWwjWAyXk5DvtunIaCXdr2n?=
 =?us-ascii?Q?24Rys5vxEX3xPrsB9GZa13JO8pBbV6+JdsMu4MhaOgQKTtxqhjP9WysC6DIf?=
 =?us-ascii?Q?LHOfyX2jgo0ib5X4C9YNwWWPyMFxFdOIi2ECEvnWL6QWlweEWfXBR9FRnq4X?=
 =?us-ascii?Q?C5MJMOyeu4f8BAQlu/pXBB80Kda/6DwVx5hOZUCtsic7ut7ZQ/tT+oRYirM3?=
 =?us-ascii?Q?RfI2p/Ca3Uey2tVWu9sjrqrlWRBigQ1kC8Cb+xywWxBmQz2BzYDLj9s9m4pC?=
 =?us-ascii?Q?cw1wDROwFJ6gjjE+XcuowjmYfd3aom+1WmwvNBu1IlrSOP4BeN53GeNRK35n?=
 =?us-ascii?Q?/pCtl8HdbAt3+e730Ad0JgWKGdV5VZDIV1KLo43Tu6XhYNNpQa6Gsj3neuUk?=
 =?us-ascii?Q?wPUTIkWobsSNFUmX/TTuBFK1MFM+weLfEaXCtV7JbRwLHunW7jWcDnz1bGm1?=
 =?us-ascii?Q?hgsbCEHtMyUSIXmFws8GWQ0VlU7I3rWJ3m0h79GhYa2GyIRZeedMOJ5M7NkR?=
 =?us-ascii?Q?IhVHXGCRVEMNMPxf9xStuudWSy5e8CUnbZban270D8Ev65E13IAZGYpcDXbt?=
 =?us-ascii?Q?tAM52kl0m6ckLDYzamJTDQzLdA5PyoZNBeG2CunSQqYFxXf9rOlmhj4WnJ86?=
 =?us-ascii?Q?NSlWyHWCTEX8yOgGDeGm9PeYaEjCVvw11dzjmsvMCV3ms1OPRYzgZ1E+E3ts?=
 =?us-ascii?Q?2nteb0WUt9D46weusL8bmRwuc8Dx+uyuGw/H9v2hyojCaouV5t/O6X/UyGlI?=
 =?us-ascii?Q?MN2NohhUyStekwTp68CvtWCvFDCVsZ/H4UZu62YOThmmPqAnK+FOu9UqyYge?=
 =?us-ascii?Q?uHD+YifV2gNgCsoLvptfdRzseP6TH7NLkVN2k7euO3K13XzI5gfXtUC3AAy4?=
 =?us-ascii?Q?rqf0cGmW2ECgL6R3hj4ucsp9ooQEnCNZlaFBn+b6Os9xAD9QwAqwxaq/zXU0?=
 =?us-ascii?Q?wfoHDGzhom0+3pysJhUeELr1HmT+PbTKOqlJ6vCd4XEkgGFIh1mv2hsEkN/f?=
 =?us-ascii?Q?A4FFYNagA6qSdFW8UoKS9yM6Fl6FwjhFptX6lxL96oGFcTzXJHq+2co5lx5y?=
 =?us-ascii?Q?J6I+uxaPY85qKsoZm1CG0CmmJN8cuRhFXuIpCZaUBlQ/j4RSBsmR0Z3VyIah?=
 =?us-ascii?Q?ze7yeUhxgBdZHvZ48G3nONoOsHaq388xyVYwpRHGDSqSY7TWoXK3XT54DUYz?=
 =?us-ascii?Q?+FimYOwro3icq6BomOkDpi0N+7EZbKPJa/JOOkyoOBkXe81SPQfDfeQv/Uua?=
 =?us-ascii?Q?I0pwydlqmQs5IgWuRn5ZlZb0fnEARVcUZL6uiFm5LRHaNFn3K4NNUCEwQyao?=
 =?us-ascii?Q?2H78PYVVgjOS6ZCVbACZWb2Eha7ZMpfeLXObAKN10fnMiPaeSKW4ITyH7SYN?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf229405-c1ff-47a9-32d5-08de1c9243fd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 17:39:26.8335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dEDFqurL9PCmM7r7FX+Usp2hj+sSjCsjRrEVMHWgolUrEVkFbEq+49Zs/6HLacKkuDYE1bYsfwUtdfOBC4BPDYOXU2i1QkvGAkN9t7fz7Qo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5910
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

On Fri, Oct 31, 2025 at 12:18:43PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_atomic_transition: Fix dynamic subtest (rev2)
> URL   : https://patchwork.freedesktop.org/series/156518/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17457_full -> IGTPW_13967_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13967_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13967_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/index.html
> 
> Participating hosts (12 -> 12)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13967_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-1-size-256:
>     - shard-rkl:          NOTRUN -> [FAIL][1] +3 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-4/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-1-size-256.html

The change here only affects the kms_atomic_transition test, so this
failure is unrelated.

Applied to master.  Thanks for the patch and review.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13967_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg2-9:        NOTRUN -> [SKIP][2] ([i915#8411])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@drm_buddy@drm_buddy:
>     - shard-glk10:        NOTRUN -> [DMESG-WARN][3] ([i915#15095]) +1 other test dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-glk10/igt@drm_buddy@drm_buddy.html
> 
>   * igt@gem_ccs@ctrl-surf-copy:
>     - shard-dg1:          NOTRUN -> [SKIP][4] ([i915#3555] / [i915#9323])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-17/igt@gem_ccs@ctrl-surf-copy.html
> 
>   * igt@gem_ccs@large-ctrl-surf-copy:
>     - shard-tglu:         NOTRUN -> [SKIP][5] ([i915#13008])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-10/igt@gem_ccs@large-ctrl-surf-copy.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#7697])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-8/igt@gem_close_race@multigpu-basic-threads.html
>     - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#7697])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@gem_close_race@multigpu-basic-threads.html
>     - shard-tglu:         NOTRUN -> [SKIP][8] ([i915#7697])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-4/igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_create@create-clear:
>     - shard-rkl:          [PASS][9] -> [DMESG-WARN][10] ([i915#12964]) +20 other tests dmesg-warn
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-4/igt@gem_create@create-clear.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@gem_create@create-clear.html
> 
>   * igt@gem_create@create-ext-set-pat:
>     - shard-dg2-9:        NOTRUN -> [SKIP][11] ([i915#8562])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@gem_create@create-ext-set-pat.html
> 
>   * igt@gem_ctx_sseu@mmap-args:
>     - shard-tglu:         NOTRUN -> [SKIP][12] ([i915#280])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-6/igt@gem_ctx_sseu@mmap-args.html
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-dg1:          [PASS][13] -> [DMESG-WARN][14] ([i915#4391] / [i915#4423])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-dg1-19/igt@gem_eio@in-flight-suspend.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-12/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@gem_exec_balancer@bonded-false-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#4812]) +2 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-6/igt@gem_exec_balancer@bonded-false-hang.html
>     - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#4812])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-13/igt@gem_exec_balancer@bonded-false-hang.html
> 
>   * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
>     - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#4525])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html
>     - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#4525])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-4/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html
> 
>   * igt@gem_exec_flush@basic-uc-prw-default:
>     - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#3539])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-1/igt@gem_exec_flush@basic-uc-prw-default.html
> 
>   * igt@gem_exec_flush@basic-uc-ro-default:
>     - shard-dg2-9:        NOTRUN -> [SKIP][20] ([i915#3539] / [i915#4852]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@gem_exec_flush@basic-uc-ro-default.html
> 
>   * igt@gem_exec_flush@basic-wb-prw-default:
>     - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#3539] / [i915#4852])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-15/igt@gem_exec_flush@basic-wb-prw-default.html
> 
>   * igt@gem_exec_flush@basic-wb-ro-default:
>     - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#3539] / [i915#4852])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-8/igt@gem_exec_flush@basic-wb-ro-default.html
> 
>   * igt@gem_exec_params@secure-non-master:
>     - shard-dg2-9:        NOTRUN -> [SKIP][23] +9 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@gem_exec_params@secure-non-master.html
> 
>   * igt@gem_exec_reloc@basic-gtt-read:
>     - shard-dg2-9:        NOTRUN -> [SKIP][24] ([i915#3281]) +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@gem_exec_reloc@basic-gtt-read.html
> 
>   * igt@gem_exec_reloc@basic-gtt-read-active:
>     - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#3281]) +11 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-3/igt@gem_exec_reloc@basic-gtt-read-active.html
> 
>   * igt@gem_exec_reloc@basic-gtt-wc-active:
>     - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#14544] / [i915#3281]) +3 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-active.html
> 
>   * igt@gem_exec_reloc@basic-wc-read:
>     - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#3281]) +6 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-15/igt@gem_exec_reloc@basic-wc-read.html
> 
>   * igt@gem_exec_reloc@basic-write-read:
>     - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#3281]) +2 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@gem_exec_reloc@basic-write-read.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts:
>     - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#4537] / [i915#4812])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-3/igt@gem_exec_schedule@preempt-queue-contexts.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-x:
>     - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#4860]) +2 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-4/igt@gem_fence_thrash@bo-write-verify-x.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-y:
>     - shard-dg2-9:        NOTRUN -> [SKIP][31] ([i915#4860]) +4 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@gem_fence_thrash@bo-write-verify-y.html
>     - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#4860]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-12/igt@gem_fence_thrash@bo-write-verify-y.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#2190])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@gem_huc_copy@huc-copy.html
>     - shard-tglu:         NOTRUN -> [SKIP][34] ([i915#2190])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-5/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@heavy-random:
>     - shard-glk:          NOTRUN -> [SKIP][35] ([i915#4613]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-glk5/igt@gem_lmem_swapping@heavy-random.html
> 
>   * igt@gem_lmem_swapping@massive:
>     - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#4613]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@gem_lmem_swapping@massive.html
> 
>   * igt@gem_lmem_swapping@smem-oom:
>     - shard-tglu:         NOTRUN -> [SKIP][37] ([i915#4613]) +4 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-4/igt@gem_lmem_swapping@smem-oom.html
>     - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#14544] / [i915#4613])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@gem_lmem_swapping@smem-oom.html
> 
>   * igt@gem_lmem_swapping@verify:
>     - shard-tglu-1:       NOTRUN -> [SKIP][39] ([i915#4613]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@gem_lmem_swapping@verify.html
> 
>   * igt@gem_media_vme:
>     - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#284])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-1/igt@gem_media_vme.html
>     - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#284])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-16/igt@gem_media_vme.html
> 
>   * igt@gem_mmap_gtt@big-copy:
>     - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#4077]) +13 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-6/igt@gem_mmap_gtt@big-copy.html
> 
>   * igt@gem_mmap_gtt@cpuset-big-copy-odd:
>     - shard-dg2-9:        NOTRUN -> [SKIP][43] ([i915#4077]) +5 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
> 
>   * igt@gem_mmap_gtt@flink-race:
>     - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#4077]) +9 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-12/igt@gem_mmap_gtt@flink-race.html
> 
>   * igt@gem_mmap_gtt@hang-busy:
>     - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#4077]) +1 other test skip
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-3/igt@gem_mmap_gtt@hang-busy.html
> 
>   * igt@gem_mmap_gtt@medium-copy-odd:
>     - shard-rkl:          [PASS][46] -> [DMESG-WARN][47] ([i915#12917] / [i915#12964])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-5/igt@gem_mmap_gtt@medium-copy-odd.html
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@gem_mmap_gtt@medium-copy-odd.html
> 
>   * igt@gem_mmap_offset@clear-via-pagefault:
>     - shard-mtlp:         [PASS][48] -> [ABORT][49] ([i915#14809]) +1 other test abort
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-mtlp-3/igt@gem_mmap_offset@clear-via-pagefault.html
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-3/igt@gem_mmap_offset@clear-via-pagefault.html
> 
>   * igt@gem_mmap_wc@bad-size:
>     - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4083]) +4 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-6/igt@gem_mmap_wc@bad-size.html
> 
>   * igt@gem_mmap_wc@invalid-flags:
>     - shard-dg2-9:        NOTRUN -> [SKIP][51] ([i915#4083]) +4 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@gem_mmap_wc@invalid-flags.html
> 
>   * igt@gem_mmap_wc@set-cache-level:
>     - shard-rkl:          [PASS][52] -> [SKIP][53] ([i915#14544] / [i915#1850])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@gem_mmap_wc@set-cache-level.html
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@gem_mmap_wc@set-cache-level.html
> 
>   * igt@gem_mmap_wc@write-cpu-read-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#4083]) +3 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-12/igt@gem_mmap_wc@write-cpu-read-wc.html
> 
>   * igt@gem_partial_pwrite_pread@reads:
>     - shard-dg2-9:        NOTRUN -> [SKIP][55] ([i915#3282]) +2 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@gem_partial_pwrite_pread@reads.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
>     - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#3282]) +1 other test skip
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>     - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#3282]) +2 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-14/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
> 
>   * igt@gem_pread@snoop:
>     - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#3282]) +7 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-1/igt@gem_pread@snoop.html
> 
>   * igt@gem_pread@uncached:
>     - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#14544] / [i915#3282])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@gem_pread@uncached.html
>     - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#3282])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-6/igt@gem_pread@uncached.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-tglu:         NOTRUN -> [WARN][61] ([i915#2658])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-10/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_pxp@hw-rejects-pxp-buffer:
>     - shard-tglu-1:       NOTRUN -> [SKIP][62] ([i915#13398])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-buffer.html
> 
>   * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
>     - shard-rkl:          [PASS][63] -> [TIMEOUT][64] ([i915#12917] / [i915#12964]) +2 other tests timeout
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
>     - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4270])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-18/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-off-2:
>     - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4270]) +3 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-8/igt@gem_pxp@reject-modify-context-protection-off-2.html
> 
>   * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>     - shard-dg2-9:        NOTRUN -> [SKIP][67] ([i915#4270]) +1 other test skip
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
> 
>   * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
>     - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#4270])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
> 
>   * igt@gem_pxp@verify-pxp-stale-buf-execution:
>     - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#14544] / [i915#4270])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@gem_pxp@verify-pxp-stale-buf-execution.html
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#5190] / [i915#8428]) +8 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-4/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html
>     - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#8428])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-4/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html
> 
>   * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:
>     - shard-dg2-9:        NOTRUN -> [SKIP][72] ([i915#5190] / [i915#8428]) +2 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>     - shard-dg2-9:        NOTRUN -> [SKIP][73] ([i915#4079]) +1 other test skip
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
>     - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4079])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-12/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
> 
>   * igt@gem_softpin@evict-snoop:
>     - shard-rkl:          NOTRUN -> [SKIP][75] +13 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@gem_softpin@evict-snoop.html
>     - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4885]) +1 other test skip
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-16/igt@gem_softpin@evict-snoop.html
>     - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#4885])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-6/igt@gem_softpin@evict-snoop.html
> 
>   * igt@gem_softpin@evict-snoop-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4885]) +1 other test skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-5/igt@gem_softpin@evict-snoop-interruptible.html
> 
>   * igt@gem_tiled_pread_basic:
>     - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4079])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-6/igt@gem_tiled_pread_basic.html
> 
>   * igt@gem_userptr_blits@coherency-sync:
>     - shard-dg2-9:        NOTRUN -> [SKIP][80] ([i915#3297]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@gem_userptr_blits@coherency-sync.html
> 
>   * igt@gem_userptr_blits@create-destroy-unsync:
>     - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#3297]) +3 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-7/igt@gem_userptr_blits@create-destroy-unsync.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-tglu:         NOTRUN -> [SKIP][82] ([i915#3297] / [i915#3323])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-10/igt@gem_userptr_blits@dmabuf-sync.html
>     - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#3297]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-8/igt@gem_userptr_blits@dmabuf-sync.html
>     - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#3297] / [i915#3323])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@gem_userptr_blits@dmabuf-sync.html
>     - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#3297])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-19/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@dmabuf-unsync:
>     - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#14544] / [i915#3297])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html
>     - shard-tglu:         NOTRUN -> [SKIP][87] ([i915#3297]) +2 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-4/igt@gem_userptr_blits@dmabuf-unsync.html
> 
>   * igt@gem_userptr_blits@forbidden-operations:
>     - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#3282] / [i915#3297])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@gem_userptr_blits@forbidden-operations.html
>     - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#3282] / [i915#3297])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-3/igt@gem_userptr_blits@forbidden-operations.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
>     - shard-dg2-9:        NOTRUN -> [SKIP][90] ([i915#3297] / [i915#4880])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
> 
>   * igt@gem_userptr_blits@readonly-unsync:
>     - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#3297]) +2 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@gem_userptr_blits@readonly-unsync.html
> 
>   * igt@gem_userptr_blits@sd-probe:
>     - shard-dg2-9:        NOTRUN -> [SKIP][92] ([i915#3297] / [i915#4958])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@gem_userptr_blits@sd-probe.html
> 
>   * igt@gem_workarounds@suspend-resume-fd:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][93] ([i915#13356] / [i915#14586])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-glk6/igt@gem_workarounds@suspend-resume-fd.html
> 
>   * igt@gen9_exec_parse@basic-rejected-ctx-param:
>     - shard-tglu:         NOTRUN -> [SKIP][94] ([i915#2527] / [i915#2856]) +3 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-9/igt@gen9_exec_parse@basic-rejected-ctx-param.html
> 
>   * igt@gen9_exec_parse@secure-batches:
>     - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#2856]) +4 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-7/igt@gen9_exec_parse@secure-batches.html
>     - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#14544] / [i915#2527])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html
> 
>   * igt@gen9_exec_parse@unaligned-access:
>     - shard-dg2-9:        NOTRUN -> [SKIP][97] ([i915#2856]) +3 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@gen9_exec_parse@unaligned-access.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][98] ([i915#2527] / [i915#2856])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@gen9_exec_parse@unaligned-access.html
> 
>   * igt@i915_drm_fdinfo@all-busy-check-all:
>     - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#14123])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-13/igt@i915_drm_fdinfo@all-busy-check-all.html
> 
>   * igt@i915_drm_fdinfo@all-busy-idle-check-all:
>     - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#14123]) +1 other test skip
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-3/igt@i915_drm_fdinfo@all-busy-idle-check-all.html
> 
>   * igt@i915_drm_fdinfo@most-busy-idle-check-all:
>     - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#14073]) +6 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-3/igt@i915_drm_fdinfo@most-busy-idle-check-all.html
> 
>   * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs0:
>     - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#14073]) +5 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-16/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs0.html
> 
>   * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:
>     - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#14073]) +7 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-1/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1.html
> 
>   * igt@i915_drm_fdinfo@virtual-busy-all:
>     - shard-dg2-9:        NOTRUN -> [SKIP][104] ([i915#14118])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@i915_drm_fdinfo@virtual-busy-all.html
> 
>   * igt@i915_drm_fdinfo@virtual-busy-idle-all:
>     - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#14118]) +1 other test skip
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-5/igt@i915_drm_fdinfo@virtual-busy-idle-all.html
> 
>   * igt@i915_module_load@reload-no-display:
>     - shard-dg2-9:        NOTRUN -> [DMESG-WARN][106] ([i915#13029] / [i915#14545])
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@i915_module_load@reload-no-display.html
> 
>   * igt@i915_module_load@resize-bar:
>     - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#6412])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-9/igt@i915_module_load@resize-bar.html
> 
>   * igt@i915_pm_freq_api@freq-reset-multiple:
>     - shard-tglu-1:       NOTRUN -> [SKIP][108] ([i915#8399])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html
> 
>   * igt@i915_pm_rc6_residency@rc6-accuracy:
>     - shard-rkl:          [PASS][109] -> [FAIL][110] ([i915#12964]) +1 other test fail
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@i915_pm_rc6_residency@rc6-accuracy.html
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-accuracy.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle:
>     - shard-tglu-1:       NOTRUN -> [SKIP][111] ([i915#14498])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle.html
> 
>   * igt@i915_pm_rpm@system-suspend-execbuf:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][112] ([i915#13356] / [i915#15172])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-glk9/igt@i915_pm_rpm@system-suspend-execbuf.html
> 
>   * igt@i915_pm_rps@min-max-config-idle:
>     - shard-dg2-9:        NOTRUN -> [SKIP][113] ([i915#11681] / [i915#6621])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@i915_pm_rps@min-max-config-idle.html
> 
>   * igt@i915_pm_rps@thresholds:
>     - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#11681])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-1/igt@i915_pm_rps@thresholds.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#4387])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-7/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@i915_query@hwconfig_table:
>     - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#6245])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-14/igt@i915_query@hwconfig_table.html
> 
>   * igt@i915_query@test-query-geometry-subslices:
>     - shard-tglu-1:       NOTRUN -> [SKIP][117] ([i915#5723])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@i915_query@test-query-geometry-subslices.html
>     - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#5723])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-12/igt@i915_query@test-query-geometry-subslices.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - shard-dg2:          NOTRUN -> [DMESG-FAIL][119] ([i915#12061]) +1 other test dmesg-fail
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-3/igt@i915_selftest@live@workarounds.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-dg2:          [PASS][120] -> [DMESG-WARN][121] ([i915#14545])
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-dg2-6/igt@i915_suspend@basic-s3-without-i915.html
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-7/igt@i915_suspend@basic-s3-without-i915.html
>     - shard-dg1:          [PASS][122] -> [DMESG-WARN][123] ([i915#14545])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-dg1-17/igt@i915_suspend@basic-s3-without-i915.html
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-14/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@i915_suspend@forcewake:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][124] ([i915#4817]) +1 other test incomplete
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-glk9/igt@i915_suspend@forcewake.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#4212])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-8/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
> 
>   * igt@kms_addfb_basic@clobberred-modifier:
>     - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#4212]) +1 other test skip
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-18/igt@kms_addfb_basic@clobberred-modifier.html
> 
>   * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>     - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#4212]) +3 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-7/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#12454] / [i915#12712])
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][129] ([i915#12454] / [i915#12712])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_atomic@plane-overlay-legacy:
>     - shard-rkl:          [PASS][130] -> [SKIP][131] ([i915#14544]) +44 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@kms_atomic@plane-overlay-legacy.html
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_atomic@plane-overlay-legacy.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#1769] / [i915#3555])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-glk10:        NOTRUN -> [SKIP][133] ([i915#1769])
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-glk10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#5286]) +2 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>     - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#5286]) +6 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-4/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#4538] / [i915#5286]) +4 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-tglu-1:       NOTRUN -> [SKIP][137] ([i915#5286]) +2 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#3638])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-12/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#3638]) +1 other test skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
>     - shard-dg2-9:        NOTRUN -> [SKIP][140] ([i915#4538] / [i915#5190]) +5 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#5190]) +1 other test skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>     - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#6187])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#4538] / [i915#5190]) +12 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#4538]) +2 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
>     - shard-glk10:        NOTRUN -> [SKIP][145] +171 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-glk10/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
>     - shard-tglu-1:       NOTRUN -> [SKIP][147] ([i915#6095]) +34 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-dg2-9:        NOTRUN -> [SKIP][148] ([i915#12313])
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#6095]) +84 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-2/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#12313])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-14/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#12805])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#14098] / [i915#6095]) +45 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>     - shard-dg2-9:        NOTRUN -> [SKIP][153] ([i915#12805])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#6095]) +13 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#12313]) +1 other test skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#10307] / [i915#6095]) +108 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#6095]) +158 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#6095]) +42 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-hdmi-a-2:
>     - shard-dg2-9:        NOTRUN -> [SKIP][159] ([i915#10307] / [i915#6095]) +34 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#3742])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-6/igt@kms_cdclk@mode-transition-all-outputs.html
>     - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#13784])
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-4/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_audio@dp-audio:
>     - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#11151] / [i915#7828]) +13 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-7/igt@kms_chamelium_audio@dp-audio.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio:
>     - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#11151] / [i915#7828]) +12 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-3/igt@kms_chamelium_audio@hdmi-audio.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio-edid:
>     - shard-tglu-1:       NOTRUN -> [SKIP][164] ([i915#11151] / [i915#7828]) +4 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio-edid.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-mtlp:         NOTRUN -> [SKIP][165] +2 other tests skip
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-8/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#11151] / [i915#7828]) +6 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-15/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
>     - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#11151] / [i915#7828]) +1 other test skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-4/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
>     - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#11151] / [i915#7828]) +2 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm:
>     - shard-dg2-9:        NOTRUN -> [SKIP][169] ([i915#11151] / [i915#7828]) +6 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_chamelium_hpd@dp-hpd-storm.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
>     - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#11151] / [i915#14544] / [i915#7828])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
> 
>   * igt@kms_color@ctm-negative:
>     - shard-rkl:          [PASS][171] -> [SKIP][172] ([i915#12655] / [i915#14544]) +2 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-5/igt@kms_color@ctm-negative.html
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_color@ctm-negative.html
> 
>   * igt@kms_color@deep-color:
>     - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#12655] / [i915#3555])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-7/igt@kms_color@deep-color.html
>     - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#12655] / [i915#14544] / [i915#3555])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_color@deep-color.html
>     - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#3555] / [i915#9979])
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-8/igt@kms_color@deep-color.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#7116] / [i915#9424])
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-17/igt@kms_content_protection@atomic.html
>     - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#7118] / [i915#9424])
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-5/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-tglu-1:       NOTRUN -> [SKIP][178] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#3299]) +2 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-4/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2-9:        NOTRUN -> [SKIP][180] ([i915#3299])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#3116])
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#3116] / [i915#3299]) +1 other test skip
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-6/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#9424])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_content_protection@lic-type-0.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][184] ([i915#6944] / [i915#9424])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#7116])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-18/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-dg2-9:        NOTRUN -> [SKIP][186] ([i915#7118] / [i915#9424])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_content_protection@type1.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-7/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#13049])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>     - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#13049])
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x85:
>     - shard-tglu:         NOTRUN -> [FAIL][190] ([i915#13566]) +1 other test fail
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>     - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#3555]) +4 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
>     - shard-dg2-9:        NOTRUN -> [SKIP][192] ([i915#3555]) +4 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][193] ([i915#3555]) +3 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x21:
>     - shard-tglu:         [PASS][194] -> [FAIL][195] ([i915#13566]) +1 other test fail
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-64x21.html
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-64x21.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [FAIL][196] ([i915#13566])
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-rkl:          [PASS][197] -> [INCOMPLETE][198] ([i915#12358] / [i915#14152])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-2/igt@kms_cursor_crc@cursor-suspend.html
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][199] ([i915#12358] / [i915#14152])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#14544]) +18 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#4103] / [i915#4213]) +1 other test skip
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#4103] / [i915#4213]) +2 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipa-toggle:
>     - shard-rkl:          NOTRUN -> [DMESG-WARN][203] ([i915#12917] / [i915#12964])
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#13046] / [i915#5354]) +3 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-dg2-9:        NOTRUN -> [SKIP][205] ([i915#13046] / [i915#5354]) +1 other test skip
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>     - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#9067])
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-tglu-1:       NOTRUN -> [SKIP][207] ([i915#4103])
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#9723])
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-dg2-9:        NOTRUN -> [SKIP][209] ([i915#13691])
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#3804])
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
>     - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#3555]) +5 other tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-8/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#13749])
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-3/igt@kms_dp_link_training@non-uhbr-sst.html
>     - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#13749])
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-13/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#13707])
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#8812])
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-15/igt@kms_draw_crc@draw-method-mmap-gtt.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#3555] / [i915#3840])
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp:
>     - shard-tglu-1:       NOTRUN -> [SKIP][217] ([i915#3840])
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#3555] / [i915#3840] / [i915#9053])
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>     - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#3840] / [i915#9053])
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>     - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#3840] / [i915#9053])
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>     - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#3840] / [i915#9053])
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>     - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#3840] / [i915#9053])
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#3955])
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#3469])
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-5/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#1839])
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-1/igt@kms_feature_discovery@display-3x.html
>     - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#1839]) +1 other test skip
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#1839]) +1 other test skip
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-6/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#658])
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-12/igt@kms_feature_discovery@psr2.html
>     - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#658])
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-3/igt@kms_feature_discovery@psr2.html
>     - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#658])
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-1/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank:
>     - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#9934]) +9 other tests skip
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-1/igt@kms_flip@2x-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>     - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#3637] / [i915#9934]) +9 other tests skip
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-fences-interruptible:
>     - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#9934]) +3 other tests skip
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@kms_flip@2x-flip-vs-fences-interruptible.html
>     - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#8381])
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-3/igt@kms_flip@2x-flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-snb:          [PASS][235] -> [TIMEOUT][236] ([i915#14033] / [i915#14350])
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-snb5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
>     - shard-snb:          [PASS][237] -> [TIMEOUT][238] ([i915#14033])
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-snb5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
> 
>   * igt@kms_flip@2x-nonexisting-fb-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#3637] / [i915#9934]) +1 other test skip
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-2/igt@kms_flip@2x-nonexisting-fb-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip:
>     - shard-tglu-1:       NOTRUN -> [SKIP][240] ([i915#3637] / [i915#9934]) +1 other test skip
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@kms_flip@2x-plain-flip.html
> 
>   * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
>     - shard-dg2-9:        NOTRUN -> [SKIP][241] ([i915#9934])
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#9934]) +8 other tests skip
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-14/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank:
>     - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#14544] / [i915#3637]) +2 other tests skip
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@flip-vs-panning-interruptible:
>     - shard-rkl:          [PASS][244] -> [SKIP][245] ([i915#14544] / [i915#3637]) +8 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@kms_flip@flip-vs-panning-interruptible.html
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_flip@flip-vs-panning-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#2587] / [i915#2672]) +5 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>     - shard-tglu:         NOTRUN -> [SKIP][247] ([i915#2672] / [i915#3555]) +2 other tests skip
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][248] ([i915#2672] / [i915#3555])
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>     - shard-tglu-1:       NOTRUN -> [SKIP][249] ([i915#2672] / [i915#3555])
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-tglu-1:       NOTRUN -> [SKIP][250] ([i915#2587] / [i915#2672])
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#2672] / [i915#3555] / [i915#5190]) +4 other tests skip
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#2672]) +4 other tests skip
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
>     - shard-dg2-9:        NOTRUN -> [SKIP][253] ([i915#2672] / [i915#3555] / [i915#5190])
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
>     - shard-dg2-9:        NOTRUN -> [SKIP][254] ([i915#2672]) +1 other test skip
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
>     - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#2672] / [i915#3555]) +2 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
>     - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#2587] / [i915#2672] / [i915#3555])
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
>     - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#2587] / [i915#2672] / [i915#3555]) +2 other tests skip
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
>     - shard-mtlp:         NOTRUN -> [SKIP][258] ([i915#2672] / [i915#3555] / [i915#8813])
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][259] ([i915#2672] / [i915#8813])
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#2672]) +2 other tests skip
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
>     - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#2587] / [i915#2672])
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:
>     - shard-rkl:          [PASS][262] -> [SKIP][263] ([i915#14544] / [i915#3555]) +3 other tests skip
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][264] ([i915#8708]) +1 other test skip
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-9:        NOTRUN -> [SKIP][265] ([i915#15104])
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
>     - shard-rkl:          [PASS][266] -> [SKIP][267] ([i915#14544] / [i915#1849] / [i915#5354]) +5 other tests skip
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>     - shard-dg2-9:        NOTRUN -> [SKIP][268] ([i915#5354]) +14 other tests skip
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#8708]) +16 other tests skip
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-mtlp:         NOTRUN -> [SKIP][270] ([i915#1825]) +2 other tests skip
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-rte:
>     - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#5354]) +34 other tests skip
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
>     - shard-snb:          [PASS][272] -> [SKIP][273]
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][274] ([i915#10056])
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-glk1/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#5439])
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-9:        NOTRUN -> [SKIP][276] ([i915#10055])
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#15102]) +2 other tests skip
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-cpu:
>     - shard-dg2-9:        NOTRUN -> [SKIP][278] ([i915#15102]) +2 other tests skip
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#15104]) +3 other tests skip
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#15102] / [i915#3458]) +14 other tests skip
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-9:        NOTRUN -> [SKIP][281] ([i915#8708]) +9 other tests skip
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
>     - shard-snb:          NOTRUN -> [SKIP][282] +46 other tests skip
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][283] +24 other tests skip
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#8708]) +7 other tests skip
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#10433] / [i915#15102] / [i915#3458])
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-tglu-1:       NOTRUN -> [SKIP][286] ([i915#5439])
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#9766])
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#15102])
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#15104]) +2 other tests skip
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
>     - shard-mtlp:         NOTRUN -> [SKIP][290] ([i915#15104])
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
>     - shard-tglu:         NOTRUN -> [SKIP][291] ([i915#15102]) +33 other tests skip
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-tglu-1:       NOTRUN -> [SKIP][292] ([i915#15102]) +12 other tests skip
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-9:        NOTRUN -> [SKIP][293] ([i915#15102] / [i915#3458]) +9 other tests skip
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:
>     - shard-glk:          NOTRUN -> [SKIP][294] +192 other tests skip
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-glk9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#15102] / [i915#3023]) +2 other tests skip
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-tglu:         NOTRUN -> [SKIP][296] +71 other tests skip
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#1825]) +23 other tests skip
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
>     - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#15102] / [i915#3458]) +15 other tests skip
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
> 
>   * igt@kms_frontbuffer_tracking@psr-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#14544] / [i915#1849] / [i915#5354]) +4 other tests skip
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-suspend.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][300] ([i915#3555] / [i915#8228]) +2 other tests skip
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-6/igt@kms_hdr@bpc-switch-suspend.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#12713])
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#3555] / [i915#8228])
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-16/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-dg2:          [PASS][303] -> [SKIP][304] ([i915#3555] / [i915#8228])
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-dg2-10/igt@kms_hdr@static-swap.html
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-6/igt@kms_hdr@static-swap.html
>     - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#3555] / [i915#8228])
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#3555] / [i915#8228])
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-10/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_invalid_mode@uint-max-clock:
>     - shard-rkl:          [PASS][307] -> [SKIP][308] ([i915#14544] / [i915#3555] / [i915#8826])
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-5/igt@kms_invalid_mode@uint-max-clock.html
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_invalid_mode@uint-max-clock.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-dg2-9:        NOTRUN -> [SKIP][309] ([i915#10656])
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#12339])
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-9/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-dg2-9:        NOTRUN -> [SKIP][311] ([i915#12388])
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][312] ([i915#12388])
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#12339])
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-15/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-dg2-9:        NOTRUN -> [SKIP][314] ([i915#4816])
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
>     - shard-tglu-1:       NOTRUN -> [SKIP][315] +21 other tests skip
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html
> 
>   * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>     - shard-dg2:          NOTRUN -> [SKIP][316] +14 other tests skip
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-6/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
>     - shard-rkl:          [PASS][317] -> [SKIP][318] ([i915#11190] / [i915#14544]) +1 other test skip
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-5/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-glk10:        NOTRUN -> [INCOMPLETE][319] ([i915#12756] / [i915#13409] / [i915#13476])
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-glk10/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
>     - shard-glk10:        NOTRUN -> [INCOMPLETE][320] ([i915#13409] / [i915#13476])
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-glk10/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
>     - shard-tglu:         NOTRUN -> [SKIP][321] ([i915#14712])
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-2/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-rkl:          [PASS][322] -> [SKIP][323] ([i915#14544] / [i915#8825])
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_plane@plane-position-covered:
>     - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#14544] / [i915#8825])
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_plane@plane-position-covered.html
> 
>   * igt@kms_plane_alpha_blend@alpha-7efc:
>     - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#14544] / [i915#7294])
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_plane_alpha_blend@alpha-7efc.html
> 
>   * igt@kms_plane_alpha_blend@alpha-transparent-fb:
>     - shard-rkl:          [PASS][326] -> [SKIP][327] ([i915#14544] / [i915#7294]) +1 other test skip
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-2/igt@kms_plane_alpha_blend@alpha-transparent-fb.html
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_plane_alpha_blend@alpha-transparent-fb.html
> 
>   * igt@kms_plane_multiple@2x-tiling-none:
>     - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#13958])
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-none.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#13958])
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-18/igt@kms_plane_multiple@2x-tiling-yf.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][330] ([i915#13958])
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#14259]) +1 other test skip
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-3/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#14544] / [i915#8152])
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-tglu-1:       NOTRUN -> [SKIP][333] ([i915#6953])
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
>     - shard-rkl:          NOTRUN -> [SKIP][334] ([i915#12247])
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
>     - shard-rkl:          [PASS][335] -> [SKIP][336] ([i915#12247] / [i915#14544] / [i915#8152]) +4 other tests skip
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
>     - shard-rkl:          [PASS][337] -> [SKIP][338] ([i915#14544] / [i915#6953] / [i915#8152]) +1 other test skip
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a:
>     - shard-rkl:          [PASS][339] -> [SKIP][340] ([i915#12247] / [i915#14544]) +3 other tests skip
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25:
>     - shard-rkl:          [PASS][341] -> [SKIP][342] ([i915#14544] / [i915#3555] / [i915#6953] / [i915#8152]) +1 other test skip
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-rkl:          NOTRUN -> [SKIP][343] ([i915#5354]) +1 other test skip
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-tglu:         NOTRUN -> [SKIP][344] ([i915#9812]) +1 other test skip
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-2/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2-9:        NOTRUN -> [SKIP][345] ([i915#9685])
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg1:          NOTRUN -> [SKIP][346] ([i915#9685])
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-16/igt@kms_pm_dc@dc5-psr.html
>     - shard-dg2:          NOTRUN -> [SKIP][347] ([i915#9685])
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-1/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#14104])
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-3/igt@kms_pm_dc@dc6-dpms.html
>     - shard-tglu:         NOTRUN -> [FAIL][349] ([i915#9295])
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-tglu:         NOTRUN -> [SKIP][350] ([i915#4281])
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-10/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-tglu-1:       NOTRUN -> [SKIP][351] ([i915#15073]) +1 other test skip
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-rkl:          [PASS][352] -> [SKIP][353] ([i915#15073])
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-dg2-9:        NOTRUN -> [SKIP][354] ([i915#15073])
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_pm_rpm@modeset-lpsp-stress.html
>     - shard-dg1:          NOTRUN -> [SKIP][355] ([i915#15073])
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-tglu:         NOTRUN -> [SKIP][356] ([i915#15073])
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_prime@basic-crc-hybrid:
>     - shard-dg2-9:        NOTRUN -> [SKIP][357] ([i915#6524] / [i915#6805])
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_prime@basic-crc-hybrid.html
> 
>   * igt@kms_prime@d3hot:
>     - shard-rkl:          NOTRUN -> [SKIP][358] ([i915#6524])
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@kms_prime@d3hot.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][359] ([i915#11520]) +7 other tests skip
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
>     - shard-snb:          NOTRUN -> [SKIP][360] ([i915#11520]) +1 other test skip
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-snb4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
>     - shard-dg1:          NOTRUN -> [SKIP][361] ([i915#11520]) +4 other tests skip
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-16/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
>     - shard-rkl:          NOTRUN -> [SKIP][362] ([i915#11520] / [i915#14544]) +1 other test skip
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-glk10:        NOTRUN -> [SKIP][363] ([i915#11520]) +5 other tests skip
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-glk10/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
>     - shard-tglu:         NOTRUN -> [SKIP][364] ([i915#11520]) +8 other tests skip
>    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-9:        NOTRUN -> [SKIP][365] ([i915#11520]) +5 other tests skip
>    [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][366] ([i915#11520]) +1 other test skip
>    [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
>     - shard-glk:          NOTRUN -> [SKIP][367] ([i915#11520]) +4 other tests skip
>    [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-glk5/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
>     - shard-rkl:          NOTRUN -> [SKIP][368] ([i915#11520]) +2 other tests skip
>    [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
>     - shard-mtlp:         NOTRUN -> [SKIP][369] ([i915#12316])
>    [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-8/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-dg2:          NOTRUN -> [SKIP][370] ([i915#9683])
>    [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>     - shard-rkl:          NOTRUN -> [SKIP][371] ([i915#9683])
>    [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>     - shard-tglu:         NOTRUN -> [SKIP][372] ([i915#9683])
>    [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg2-9:        NOTRUN -> [SKIP][373] ([i915#9683])
>    [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-pr-cursor-mmap-cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][374] ([i915#1072] / [i915#9732]) +13 other tests skip
>    [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-15/igt@kms_psr@fbc-pr-cursor-mmap-cpu.html
> 
>   * igt@kms_psr@fbc-pr-cursor-plane-move:
>     - shard-mtlp:         NOTRUN -> [SKIP][375] ([i915#9688]) +2 other tests skip
>    [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-7/igt@kms_psr@fbc-pr-cursor-plane-move.html
> 
>   * igt@kms_psr@fbc-psr-basic:
>     - shard-rkl:          NOTRUN -> [SKIP][376] ([i915#1072] / [i915#14544] / [i915#9732]) +1 other test skip
>    [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_psr@fbc-psr-basic.html
> 
>   * igt@kms_psr@fbc-psr-cursor-plane-move:
>     - shard-dg2-9:        NOTRUN -> [SKIP][377] ([i915#1072] / [i915#9732]) +14 other tests skip
>    [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_psr@fbc-psr-cursor-plane-move.html
> 
>   * igt@kms_psr@pr-sprite-plane-move:
>     - shard-tglu:         NOTRUN -> [SKIP][378] ([i915#9732]) +27 other tests skip
>    [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-4/igt@kms_psr@pr-sprite-plane-move.html
> 
>   * igt@kms_psr@psr-cursor-render:
>     - shard-dg2:          NOTRUN -> [SKIP][379] ([i915#1072] / [i915#9732]) +26 other tests skip
>    [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-5/igt@kms_psr@psr-cursor-render.html
>     - shard-rkl:          NOTRUN -> [SKIP][380] ([i915#1072] / [i915#9732]) +9 other tests skip
>    [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@kms_psr@psr-cursor-render.html
> 
>   * igt@kms_psr@psr2-sprite-blt:
>     - shard-tglu-1:       NOTRUN -> [SKIP][381] ([i915#9732]) +11 other tests skip
>    [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@kms_psr@psr2-sprite-blt.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2-9:        NOTRUN -> [SKIP][382] ([i915#12755])
>    [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@exhaust-fences:
>     - shard-rkl:          NOTRUN -> [DMESG-WARN][383] ([i915#12964]) +3 other tests dmesg-warn
>    [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_rotation_crc@exhaust-fences.html
>     - shard-dg2:          NOTRUN -> [SKIP][384] ([i915#4235])
>    [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-4/igt@kms_rotation_crc@exhaust-fences.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2:          NOTRUN -> [SKIP][385] ([i915#12755] / [i915#5190])
>    [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-tglu:         NOTRUN -> [SKIP][386] ([i915#5289])
>    [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-rkl:          NOTRUN -> [SKIP][387] ([i915#5289])
>    [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-dg2:          NOTRUN -> [SKIP][388] ([i915#12755]) +1 other test skip
>    [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full-aspect:
>     - shard-tglu:         NOTRUN -> [SKIP][389] ([i915#3555]) +6 other tests skip
>    [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none:
>     - shard-dg1:          NOTRUN -> [SKIP][390] ([i915#3555]) +2 other tests skip
>    [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-13/igt@kms_scaling_modes@scaling-mode-none.html
> 
>   * igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options:
>     - shard-dg2-9:        NOTRUN -> [FAIL][391] ([i915#15119]) +2 other tests fail
>    [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html
> 
>   * igt@kms_selftest@drm_framebuffer:
>     - shard-dg1:          NOTRUN -> [ABORT][392] ([i915#13179]) +1 other test abort
>    [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-14/igt@kms_selftest@drm_framebuffer.html
> 
>   * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create:
>     - shard-dg1:          NOTRUN -> [FAIL][393] ([i915#15119]) +1 other test fail
>    [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-14/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html
> 
>   * igt@kms_setmode@basic:
>     - shard-tglu:         NOTRUN -> [FAIL][394] ([i915#15106]) +2 other tests fail
>    [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-5/igt@kms_setmode@basic.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-rkl:          NOTRUN -> [SKIP][395] ([i915#14544] / [i915#3555]) +1 other test skip
>    [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_setmode@basic@pipe-b-edp-1:
>     - shard-mtlp:         [PASS][396] -> [FAIL][397] ([i915#15106]) +2 other tests fail
>    [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-mtlp-3/igt@kms_setmode@basic@pipe-b-edp-1.html
>    [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-5/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>   * igt@kms_setmode@basic@pipe-b-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [FAIL][398] ([i915#15106]) +2 other tests fail
>    [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-3/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-rkl:          [PASS][399] -> [ABORT][400] ([i915#15132])
>    [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-4/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][401] ([i915#12276]) +1 other test incomplete
>    [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-glk5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [ABORT][402] ([i915#15132])
>    [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_vrr@flip-basic-fastset:
>     - shard-dg2-9:        NOTRUN -> [SKIP][403] ([i915#9906])
>    [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_vrr@flip-basic-fastset.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-tglu:         NOTRUN -> [SKIP][404] ([i915#9906]) +1 other test skip
>    [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-5/igt@kms_vrr@max-min.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-dg2:          NOTRUN -> [SKIP][405] ([i915#9906])
>    [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-8/igt@kms_vrr@seamless-rr-switch-vrr.html
>     - shard-rkl:          NOTRUN -> [SKIP][406] ([i915#9906])
>    [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-dg2:          NOTRUN -> [SKIP][407] ([i915#2437])
>    [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-4/igt@kms_writeback@writeback-check-output.html
>     - shard-dg1:          NOTRUN -> [SKIP][408] ([i915#2437])
>    [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-19/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2-9:        NOTRUN -> [SKIP][409] ([i915#2437] / [i915#9412])
>    [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>     - shard-glk:          NOTRUN -> [SKIP][410] ([i915#2437])
>    [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-glk1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-tglu:         NOTRUN -> [SKIP][411] ([i915#2437] / [i915#9412]) +1 other test skip
>    [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-3/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-tglu:         NOTRUN -> [SKIP][412] ([i915#2437])
>    [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-7/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-tglu-1:       NOTRUN -> [SKIP][413] ([i915#2437] / [i915#9412])
>    [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-1/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@perf@global-sseu-config-invalid:
>     - shard-dg2:          NOTRUN -> [SKIP][414] ([i915#7387])
>    [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-8/igt@perf@global-sseu-config-invalid.html
> 
>   * igt@perf@non-zero-reason:
>     - shard-dg2:          NOTRUN -> [FAIL][415] ([i915#9100]) +1 other test fail
>    [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-1/igt@perf@non-zero-reason.html
> 
>   * igt@perf@per-context-mode-unprivileged:
>     - shard-rkl:          NOTRUN -> [SKIP][416] ([i915#2435])
>    [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@perf@per-context-mode-unprivileged.html
> 
>   * igt@perf_pmu@busy-double-start@vecs1:
>     - shard-dg2:          NOTRUN -> [FAIL][417] ([i915#4349]) +4 other tests fail
>    [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-4/igt@perf_pmu@busy-double-start@vecs1.html
> 
>   * igt@perf_pmu@frequency@gt0:
>     - shard-dg2:          NOTRUN -> [FAIL][418] ([i915#12549] / [i915#6806]) +1 other test fail
>    [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-8/igt@perf_pmu@frequency@gt0.html
>     - shard-dg1:          NOTRUN -> [FAIL][419] ([i915#12549] / [i915#6806]) +1 other test fail
>    [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-16/igt@perf_pmu@frequency@gt0.html
> 
>   * igt@perf_pmu@rc6-all-gts:
>     - shard-dg2-9:        NOTRUN -> [SKIP][420] ([i915#8516])
>    [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@perf_pmu@rc6-all-gts.html
> 
>   * igt@perf_pmu@rc6@other-idle-gt0:
>     - shard-dg2:          NOTRUN -> [SKIP][421] ([i915#8516])
>    [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-5/igt@perf_pmu@rc6@other-idle-gt0.html
>     - shard-rkl:          NOTRUN -> [SKIP][422] ([i915#8516])
>    [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@perf_pmu@rc6@other-idle-gt0.html
>     - shard-tglu:         NOTRUN -> [SKIP][423] ([i915#8516])
>    [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-4/igt@perf_pmu@rc6@other-idle-gt0.html
> 
>   * igt@prime_mmap@test_aperture_limit:
>     - shard-dg2-9:        NOTRUN -> [SKIP][424] ([i915#14121]) +1 other test skip
>    [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-9/igt@prime_mmap@test_aperture_limit.html
> 
>   * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
>     - shard-dg1:          NOTRUN -> [SKIP][425] ([i915#14121]) +1 other test skip
>    [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-12/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - shard-dg2:          NOTRUN -> [SKIP][426] ([i915#3291] / [i915#3708])
>    [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-8/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@basic-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][427] ([i915#3708] / [i915#4077])
>    [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-1/igt@prime_vgem@basic-gtt.html
> 
>   * igt@prime_vgem@basic-write:
>     - shard-rkl:          NOTRUN -> [SKIP][428] ([i915#3291] / [i915#3708])
>    [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@prime_vgem@basic-write.html
> 
>   * igt@prime_vgem@fence-flip-hang:
>     - shard-rkl:          NOTRUN -> [SKIP][429] ([i915#3708])
>    [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@prime_vgem@fence-flip-hang.html
> 
>   * igt@prime_vgem@fence-write-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][430] ([i915#3708]) +1 other test skip
>    [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-3/igt@prime_vgem@fence-write-hang.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
>     - shard-tglu:         NOTRUN -> [FAIL][431] ([i915#12910]) +9 other tests fail
>    [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-rkl:          NOTRUN -> [SKIP][432] ([i915#9917])
>    [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@fbdev@eof:
>     - shard-rkl:          [SKIP][433] ([i915#14544] / [i915#2582]) -> [PASS][434]
>    [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@fbdev@eof.html
>    [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-3/igt@fbdev@eof.html
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-dg2:          [INCOMPLETE][435] ([i915#13356]) -> [PASS][436] +1 other test pass
>    [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-dg2-1/igt@gem_ccs@suspend-resume.html
>    [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-3/igt@gem_ccs@suspend-resume.html
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-rkl:          [ABORT][437] ([i915#15131]) -> [PASS][438]
>    [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-4/igt@gem_eio@in-flight-suspend.html
>    [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@gem_exec_big@single:
>     - shard-tglu:         [ABORT][439] ([i915#11713]) -> [PASS][440]
>    [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-tglu-5/igt@gem_exec_big@single.html
>    [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-9/igt@gem_exec_big@single.html
> 
>   * igt@gem_exec_suspend@basic-s0@smem:
>     - shard-rkl:          [INCOMPLETE][441] ([i915#13356]) -> [PASS][442] +1 other test pass
>    [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-5/igt@gem_exec_suspend@basic-s0@smem.html
>    [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@gem_exec_suspend@basic-s0@smem.html
> 
>   * igt@gem_pxp@create-protected-buffer:
>     - shard-rkl:          [TIMEOUT][443] ([i915#12964]) -> [PASS][444] +1 other test pass
>    [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@gem_pxp@create-protected-buffer.html
>    [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@gem_pxp@create-protected-buffer.html
> 
>   * igt@i915_pm_rc6_residency@rc6-accuracy:
>     - shard-dg2:          [FAIL][445] ([i915#12964]) -> [PASS][446] +1 other test pass
>    [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-dg2-3/igt@i915_pm_rc6_residency@rc6-accuracy.html
>    [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-4/igt@i915_pm_rc6_residency@rc6-accuracy.html
> 
>   * igt@i915_pm_rpm@gem-pread:
>     - shard-rkl:          [SKIP][447] ([i915#13328]) -> [PASS][448]
>    [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-7/igt@i915_pm_rpm@gem-pread.html
>    [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@i915_pm_rpm@gem-pread.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-snb:          [INCOMPLETE][449] ([i915#13729] / [i915#13821]) -> [PASS][450]
>    [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-snb7/igt@i915_pm_rps@reset.html
>    [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-snb4/igt@i915_pm_rps@reset.html
> 
>   * igt@i915_suspend@fence-restore-tiled2untiled:
>     - shard-rkl:          [ABORT][451] ([i915#15140]) -> [PASS][452]
>    [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-4/igt@i915_suspend@fence-restore-tiled2untiled.html
>    [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@i915_suspend@fence-restore-tiled2untiled.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-mtlp:         [FAIL][453] ([i915#5138]) -> [PASS][454] +1 other test pass
>    [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
>     - shard-rkl:          [SKIP][455] ([i915#14544]) -> [PASS][456] +25 other tests pass
>    [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
>    [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
>     - shard-dg1:          [DMESG-WARN][457] ([i915#4423]) -> [PASS][458] +4 other tests pass
>    [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-dg1-16/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html
>    [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-19/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_color@ctm-signed:
>     - shard-rkl:          [SKIP][459] ([i915#12655] / [i915#14544]) -> [PASS][460]
>    [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_color@ctm-signed.html
>    [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-4/igt@kms_color@ctm-signed.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:
>     - shard-tglu:         [FAIL][461] ([i915#13566]) -> [PASS][462] +5 other tests pass
>    [461]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html
>    [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_flip@dpms-off-confusion-interruptible:
>     - shard-rkl:          [SKIP][463] ([i915#14544] / [i915#3637]) -> [PASS][464] +2 other tests pass
>    [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_flip@dpms-off-confusion-interruptible.html
>    [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@kms_flip@dpms-off-confusion-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
>     - shard-rkl:          [SKIP][465] ([i915#14544] / [i915#3555]) -> [PASS][466] +4 other tests pass
>    [465]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
>    [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-rkl:          [SKIP][467] ([i915#14544] / [i915#1849] / [i915#5354]) -> [PASS][468]
>    [467]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
>    [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
>     - shard-dg2:          [FAIL][469] ([i915#6880]) -> [PASS][470]
>    [469]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
>    [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - shard-rkl:          [SKIP][471] ([i915#11190] / [i915#14544]) -> [PASS][472]
>    [471]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
>    [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
>     - shard-rkl:          [DMESG-WARN][473] ([i915#12964]) -> [PASS][474] +34 other tests pass
>    [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-5/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
>    [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-min:
>     - shard-rkl:          [SKIP][475] ([i915#14544] / [i915#7294]) -> [PASS][476]
>    [475]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_plane_alpha_blend@constant-alpha-min.html
>    [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@kms_plane_alpha_blend@constant-alpha-min.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
>     - shard-rkl:          [SKIP][477] ([i915#14544] / [i915#3555] / [i915#8152]) -> [PASS][478]
>    [477]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
>    [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
>     - shard-rkl:          [SKIP][479] ([i915#12247] / [i915#14544]) -> [PASS][480] +1 other test pass
>    [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html
>    [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
>     - shard-rkl:          [SKIP][481] ([i915#14544] / [i915#3555] / [i915#6953] / [i915#8152]) -> [PASS][482]
>    [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
>    [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b:
>     - shard-rkl:          [SKIP][483] ([i915#12247] / [i915#14544] / [i915#8152]) -> [PASS][484] +1 other test pass
>    [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b.html
>    [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-rkl:          [SKIP][485] ([i915#14544] / [i915#15073]) -> [PASS][486]
>    [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_pm_rpm@dpms-non-lpsp.html
>    [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_pm_rpm@fences-dpms:
>     - shard-rkl:          [SKIP][487] ([i915#14544] / [i915#1849]) -> [PASS][488]
>    [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_pm_rpm@fences-dpms.html
>    [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-4/igt@kms_pm_rpm@fences-dpms.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-dg2:          [SKIP][489] ([i915#15073]) -> [PASS][490]
>    [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html
>    [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp.html
>     - shard-rkl:          [SKIP][491] ([i915#15073]) -> [PASS][492]
>    [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html
>    [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_properties@plane-properties-legacy:
>     - shard-rkl:          [SKIP][493] ([i915#11521] / [i915#14544]) -> [PASS][494]
>    [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html
>    [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@kms_properties@plane-properties-legacy.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-b-hdmi-a-1:
>     - shard-rkl:          [ABORT][495] ([i915#15132]) -> [PASS][496] +1 other test pass
>    [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-4/igt@kms_vblank@ts-continuation-suspend@pipe-b-hdmi-a-1.html
>    [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@kms_vblank@ts-continuation-suspend@pipe-b-hdmi-a-1.html
> 
>   * igt@perf_pmu@busy-double-start@vcs0:
>     - shard-dg1:          [FAIL][497] ([i915#4349]) -> [PASS][498] +1 other test pass
>    [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-dg1-18/igt@perf_pmu@busy-double-start@vcs0.html
>    [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-15/igt@perf_pmu@busy-double-start@vcs0.html
> 
>   * igt@perf_pmu@busy-double-start@vecs0:
>     - shard-mtlp:         [FAIL][499] ([i915#4349]) -> [PASS][500] +2 other tests pass
>    [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-mtlp-7/igt@perf_pmu@busy-double-start@vecs0.html
>    [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-mtlp-8/igt@perf_pmu@busy-double-start@vecs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-rkl:          [SKIP][501] ([i915#14544] / [i915#6230]) -> [SKIP][502] ([i915#6230])
>    [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@api_intel_bb@crc32.html
>    [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@api_intel_bb@crc32.html
> 
>   * igt@api_intel_bb@object-reloc-keep-cache:
>     - shard-rkl:          [SKIP][503] ([i915#8411]) -> [SKIP][504] ([i915#14544] / [i915#8411]) +2 other tests skip
>    [503]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-7/igt@api_intel_bb@object-reloc-keep-cache.html
>    [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-cache.html
> 
>   * igt@gem_ccs@block-multicopy-compressed:
>     - shard-rkl:          [SKIP][505] ([i915#9323]) -> [SKIP][506] ([i915#14544] / [i915#9323])
>    [505]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-7/igt@gem_ccs@block-multicopy-compressed.html
>    [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-rkl:          [SKIP][507] ([i915#14544] / [i915#9323]) -> [SKIP][508] ([i915#9323])
>    [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@gem_ccs@suspend-resume.html
>    [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@gem_ccs@suspend-resume.html
> 
>   * igt@gem_close_race@multigpu-basic-process:
>     - shard-rkl:          [SKIP][509] ([i915#7697]) -> [SKIP][510] ([i915#14544] / [i915#7697])
>    [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-7/igt@gem_close_race@multigpu-basic-process.html
>    [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html
> 
>   * igt@gem_ctx_sseu@invalid-args:
>     - shard-rkl:          [SKIP][511] ([i915#280]) -> [SKIP][512] ([i915#14544] / [i915#280])
>    [511]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@gem_ctx_sseu@invalid-args.html
>    [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html
> 
>   * igt@gem_exec_balancer@parallel-balancer:
>     - shard-rkl:          [SKIP][513] ([i915#4525]) -> [SKIP][514] ([i915#14544] / [i915#4525]) +2 other tests skip
>    [513]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-2/igt@gem_exec_balancer@parallel-balancer.html
>    [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html
> 
>   * igt@gem_exec_capture@capture-recoverable:
>     - shard-rkl:          [SKIP][515] ([i915#6344]) -> [SKIP][516] ([i915#14544] / [i915#6344])
>    [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-5/igt@gem_exec_capture@capture-recoverable.html
>    [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html
> 
>   * igt@gem_exec_reloc@basic-wc-cpu:
>     - shard-rkl:          [SKIP][517] ([i915#14544] / [i915#3281]) -> [SKIP][518] ([i915#3281]) +2 other tests skip
>    [517]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@gem_exec_reloc@basic-wc-cpu.html
>    [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-3/igt@gem_exec_reloc@basic-wc-cpu.html
> 
>   * igt@gem_exec_reloc@basic-wc-read-noreloc:
>     - shard-rkl:          [SKIP][519] ([i915#3281]) -> [SKIP][520] ([i915#14544] / [i915#3281]) +5 other tests skip
>    [519]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-5/igt@gem_exec_reloc@basic-wc-read-noreloc.html
>    [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read-noreloc.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random:
>     - shard-rkl:          [SKIP][521] ([i915#4613]) -> [SKIP][522] ([i915#14544] / [i915#4613]) +1 other test skip
>    [521]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random.html
>    [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>     - shard-rkl:          [SKIP][523] ([i915#14544] / [i915#4613]) -> [SKIP][524] ([i915#4613])
>    [523]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
>    [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
> 
>   * igt@gem_media_vme:
>     - shard-rkl:          [SKIP][525] ([i915#284]) -> [SKIP][526] ([i915#14544] / [i915#284])
>    [525]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@gem_media_vme.html
>    [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@gem_media_vme.html
> 
>   * igt@gem_partial_pwrite_pread@reads-display:
>     - shard-rkl:          [SKIP][527] ([i915#14544] / [i915#3282]) -> [SKIP][528] ([i915#3282])
>    [527]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-display.html
>    [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@gem_partial_pwrite_pread@reads-display.html
> 
>   * igt@gem_pread@snoop:
>     - shard-rkl:          [SKIP][529] ([i915#3282]) -> [SKIP][530] ([i915#14544] / [i915#3282]) +1 other test skip
>    [529]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@gem_pread@snoop.html
>    [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@gem_pread@snoop.html
> 
>   * igt@gem_pxp@hw-rejects-pxp-context:
>     - shard-rkl:          [FAIL][531] ([i915#15169]) -> [TIMEOUT][532] ([i915#12917] / [i915#12964])
>    [531]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.html
>    [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-context.html
> 
>   * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
>     - shard-rkl:          [SKIP][533] ([i915#3297]) -> [SKIP][534] ([i915#14544] / [i915#3297])
>    [533]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
>    [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
> 
>   * igt@gen7_exec_parse@batch-without-end:
>     - shard-rkl:          [SKIP][535] -> [SKIP][536] ([i915#14544]) +11 other tests skip
>    [535]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-7/igt@gen7_exec_parse@batch-without-end.html
>    [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@gen7_exec_parse@batch-without-end.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-rkl:          [SKIP][537] ([i915#14544] / [i915#2527]) -> [SKIP][538] ([i915#2527]) +1 other test skip
>    [537]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@gen9_exec_parse@allowed-single.html
>    [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@gen9_exec_parse@shadow-peek:
>     - shard-rkl:          [SKIP][539] ([i915#2527]) -> [SKIP][540] ([i915#14544] / [i915#2527]) +1 other test skip
>    [539]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html
>    [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html
> 
>   * igt@i915_pm_freq_api@freq-basic-api:
>     - shard-rkl:          [SKIP][541] ([i915#8399]) -> [SKIP][542] ([i915#14544] / [i915#8399])
>    [541]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@i915_pm_freq_api@freq-basic-api.html
>    [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@i915_pm_freq_api@freq-basic-api.html
> 
>   * igt@i915_pm_rpm@system-suspend:
>     - shard-rkl:          [INCOMPLETE][543] ([i915#13356]) -> [ABORT][544] ([i915#15060])
>    [543]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-3/igt@i915_pm_rpm@system-suspend.html
>    [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-4/igt@i915_pm_rpm@system-suspend.html
> 
>   * igt@i915_query@hwconfig_table:
>     - shard-rkl:          [SKIP][545] ([i915#14544] / [i915#6245]) -> [SKIP][546] ([i915#6245])
>    [545]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@i915_query@hwconfig_table.html
>    [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@i915_query@hwconfig_table.html
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-rkl:          [SKIP][547] ([i915#14544] / [i915#7707]) -> [SKIP][548] ([i915#7707])
>    [547]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@intel_hwmon@hwmon-read.html
>    [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-rkl:          [SKIP][549] ([i915#14544]) -> [SKIP][550] ([i915#1769] / [i915#3555])
>    [549]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>    [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
>     - shard-rkl:          [SKIP][551] ([i915#5286]) -> [SKIP][552] ([i915#14544]) +2 other tests skip
>    [551]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
>    [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
>     - shard-rkl:          [SKIP][553] ([i915#14544]) -> [SKIP][554] ([i915#5286]) +2 other tests skip
>    [553]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
>    [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-rkl:          [SKIP][555] ([i915#3638]) -> [SKIP][556] ([i915#14544]) +1 other test skip
>    [555]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@kms_big_fb@linear-32bpp-rotate-90.html
>    [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-rkl:          [SKIP][557] ([i915#14544]) -> [SKIP][558] ([i915#3638]) +2 other tests skip
>    [557]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
>    [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-ccs:
>     - shard-rkl:          [SKIP][559] ([i915#14544]) -> [SKIP][560] ([i915#14098] / [i915#6095]) +5 other tests skip
>    [559]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html
>    [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>     - shard-rkl:          [SKIP][561] ([i915#14544]) -> [SKIP][562] ([i915#12313])
>    [561]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
>    [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>     - shard-rkl:          [SKIP][563] ([i915#14544]) -> [SKIP][564] ([i915#12805])
>    [563]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
>    [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          [SKIP][565] ([i915#6095]) -> [SKIP][566] ([i915#14098] / [i915#6095])
>    [565]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-hdmi-a-2.html
>    [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          [SKIP][567] ([i915#14098] / [i915#6095]) -> [SKIP][568] ([i915#6095]) +4 other tests skip
>    [567]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-b-hdmi-a-2.html
>    [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
>     - shard-rkl:          [SKIP][569] ([i915#14098] / [i915#6095]) -> [SKIP][570] ([i915#14544]) +9 other tests skip
>    [569]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
>    [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>     - shard-rkl:          [SKIP][571] ([i915#12313]) -> [SKIP][572] ([i915#14544]) +2 other tests skip
>    [571]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
>    [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-rkl:          [SKIP][573] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][574] ([i915#11151] / [i915#7828]) +4 other tests skip
>    [573]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
>    [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_frames@vga-frame-dump:
>     - shard-rkl:          [SKIP][575] ([i915#11151] / [i915#7828]) -> [SKIP][576] ([i915#11151] / [i915#14544] / [i915#7828]) +5 other tests skip
>    [575]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@kms_chamelium_frames@vga-frame-dump.html
>    [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_chamelium_frames@vga-frame-dump.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-rkl:          [SKIP][577] ([i915#14544]) -> [SKIP][578] ([i915#3116])
>    [577]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html
>    [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-dg1:          [SKIP][579] ([i915#9424]) -> [SKIP][580] ([i915#9433])
>    [579]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-dg1-15/igt@kms_content_protection@mei-interface.html
>    [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-12/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-rkl:          [SKIP][581] ([i915#14544]) -> [SKIP][582] ([i915#7118])
>    [581]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_content_protection@srm.html
>    [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-4/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-random-256x85:
>     - shard-rkl:          [FAIL][583] ([i915#13566]) -> [SKIP][584] ([i915#14544]) +2 other tests skip
>    [583]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-7/igt@kms_cursor_crc@cursor-random-256x85.html
>    [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_cursor_crc@cursor-random-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x21:
>     - shard-rkl:          [SKIP][585] ([i915#14544]) -> [FAIL][586] ([i915#13566])
>    [585]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-64x21.html
>    [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-64x21.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x64:
>     - shard-rkl:          [DMESG-WARN][587] ([i915#12964]) -> [SKIP][588] ([i915#14544]) +1 other test skip
>    [587]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-64x64.html
>    [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-64x64.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-rkl:          [SKIP][589] ([i915#11190] / [i915#14544]) -> [SKIP][590] ([i915#4103])
>    [589]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>    [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-rkl:          [SKIP][591] ([i915#14544]) -> [SKIP][592] +10 other tests skip
>    [591]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>    [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-rkl:          [SKIP][593] ([i915#4103]) -> [SKIP][594] ([i915#14544])
>    [593]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
>    [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_dp_link_training@uhbr-mst:
>     - shard-rkl:          [SKIP][595] ([i915#13748]) -> [SKIP][596] ([i915#14544])
>    [595]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-7/igt@kms_dp_link_training@uhbr-mst.html
>    [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-rkl:          [SKIP][597] ([i915#13707]) -> [SKIP][598] ([i915#14544])
>    [597]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
>    [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-rkl:          [SKIP][599] ([i915#3840]) -> [SKIP][600] ([i915#14544])
>    [599]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
>    [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-formats:
>     - shard-rkl:          [SKIP][601] ([i915#3555] / [i915#3840]) -> [SKIP][602] ([i915#14544])
>    [601]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@kms_dsc@dsc-with-formats.html
>    [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_dsc@dsc-with-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-rkl:          [SKIP][603] ([i915#14544]) -> [SKIP][604] ([i915#3555] / [i915#3840])
>    [603]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.html
>    [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank:
>     - shard-rkl:          [SKIP][605] ([i915#9934]) -> [SKIP][606] ([i915#14544] / [i915#9934]) +2 other tests skip
>    [605]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@kms_flip@2x-absolute-wf_vblank.html
>    [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_flip@2x-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-wf_vblank:
>     - shard-rkl:          [SKIP][607] ([i915#14544] / [i915#9934]) -> [SKIP][608] ([i915#9934]) +6 other tests skip
>    [607]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_flip@2x-flip-vs-wf_vblank.html
>    [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_flip@2x-flip-vs-wf_vblank.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
>     - shard-dg1:          [SKIP][609] ([i915#2672] / [i915#3555]) -> [SKIP][610] ([i915#2672] / [i915#3555] / [i915#4423])
>    [609]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-dg1-19/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
>    [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
>     - shard-dg1:          [SKIP][611] ([i915#2587] / [i915#2672]) -> [SKIP][612] ([i915#2587] / [i915#2672] / [i915#4423])
>    [611]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-dg1-19/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html
>    [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>     - shard-rkl:          [SKIP][613] ([i915#2672] / [i915#3555]) -> [SKIP][614] ([i915#14544] / [i915#3555]) +2 other tests skip
>    [613]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
>    [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-rkl:          [SKIP][615] ([i915#14544] / [i915#1849] / [i915#5354]) -> [DMESG-WARN][616] ([i915#12964])
>    [615]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
>    [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>     - shard-rkl:          [SKIP][617] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][618] ([i915#1825]) +21 other tests skip
>    [617]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
>    [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-rkl:          [SKIP][619] ([i915#1825]) -> [SKIP][620] ([i915#14544] / [i915#1849] / [i915#5354]) +28 other tests skip
>    [619]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt:
>     - shard-dg1:          [SKIP][621] ([i915#8708]) -> [SKIP][622] ([i915#4423] / [i915#8708])
>    [621]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt.html
>    [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-rkl:          [SKIP][623] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][624] ([i915#5439])
>    [623]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
>    [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-rkl:          [SKIP][625] ([i915#15102] / [i915#3023]) -> [SKIP][626] ([i915#14544] / [i915#1849] / [i915#5354]) +8 other tests skip
>    [625]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
>    [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>     - shard-rkl:          [SKIP][627] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][628] ([i915#15102] / [i915#3023]) +6 other tests skip
>    [627]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
>    [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
>     - shard-rkl:          [SKIP][629] ([i915#15102]) -> [SKIP][630] ([i915#14544]) +6 other tests skip
>    [629]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html
>    [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
>     - shard-dg2:          [SKIP][631] ([i915#10433] / [i915#15102] / [i915#3458]) -> [SKIP][632] ([i915#15102] / [i915#3458])
>    [631]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html
>    [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
>     - shard-dg2:          [SKIP][633] ([i915#15102] / [i915#3458]) -> [SKIP][634] ([i915#10433] / [i915#15102] / [i915#3458]) +2 other tests skip
>    [633]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
>    [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-rkl:          [SKIP][635] ([i915#14544]) -> [SKIP][636] ([i915#3555] / [i915#8228]) +1 other test skip
>    [635]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_hdr@bpc-switch-dpms.html
>    [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@kms_hdr@bpc-switch-dpms.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-dg2:          [SKIP][637] ([i915#13331]) -> [SKIP][638] ([i915#12713])
>    [637]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-dg2-10/igt@kms_hdr@brightness-with-hdr.html
>    [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg2-3/igt@kms_hdr@brightness-with-hdr.html
>     - shard-dg1:          [SKIP][639] ([i915#12713]) -> [SKIP][640] ([i915#1187] / [i915#12713])
>    [639]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-dg1-16/igt@kms_hdr@brightness-with-hdr.html
>    [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html
>     - shard-tglu:         [SKIP][641] ([i915#1187] / [i915#12713]) -> [SKIP][642] ([i915#12713])
>    [641]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html
>    [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-tglu-5/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-rkl:          [SKIP][643] ([i915#3555] / [i915#8228]) -> [SKIP][644] ([i915#14544]) +1 other test skip
>    [643]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-5/igt@kms_hdr@static-toggle.html
>    [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_joiner@basic-force-big-joiner:
>     - shard-rkl:          [SKIP][645] ([i915#12388]) -> [SKIP][646] ([i915#12388] / [i915#14544])
>    [645]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@kms_joiner@basic-force-big-joiner.html
>    [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-rkl:          [SKIP][647] ([i915#12394] / [i915#14544]) -> [SKIP][648] ([i915#12394])
>    [647]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_joiner@basic-force-ultra-joiner.html
>    [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-rkl:          [SKIP][649] ([i915#12339] / [i915#14544]) -> [SKIP][650] ([i915#12339])
>    [649]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
>    [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-rkl:          [SKIP][651] ([i915#4816]) -> [SKIP][652] ([i915#4070] / [i915#4816])
>    [651]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-rkl:          [SKIP][653] ([i915#14544]) -> [SKIP][654] ([i915#13958]) +1 other test skip
>    [653]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-y.html
>    [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-rkl:          [SKIP][655] ([i915#14544]) -> [SKIP][656] ([i915#14259])
>    [655]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_plane_multiple@tiling-yf.html
>    [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:
>     - shard-rkl:          [SKIP][657] ([i915#12247] / [i915#14544]) -> [SKIP][658] ([i915#12247])
>    [657]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html
>    [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
>     - shard-rkl:          [SKIP][659] ([i915#12247] / [i915#14544] / [i915#8152]) -> [SKIP][660] ([i915#12247]) +1 other test skip
>    [659]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html
>    [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html
> 
>   * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
>     - shard-rkl:          [SKIP][661] ([i915#12247]) -> [SKIP][662] ([i915#12247] / [i915#14544])
>    [661]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
>    [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
> 
>   * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b:
>     - shard-rkl:          [SKIP][663] ([i915#12247]) -> [SKIP][664] ([i915#12247] / [i915#14544] / [i915#8152]) +1 other test skip
>    [663]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html
>    [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-rkl:          [SKIP][665] ([i915#9685]) -> [SKIP][666] ([i915#14544] / [i915#9685])
>    [665]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@kms_pm_dc@dc5-psr.html
>    [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-rkl:          [SKIP][667] ([i915#3828]) -> [SKIP][668] ([i915#14544] / [i915#3828])
>    [667]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-7/igt@kms_pm_dc@dc5-retention-flops.html
>    [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-dg1:          [SKIP][669] ([i915#4423] / [i915#9340]) -> [SKIP][670] ([i915#9340])
>    [669]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-dg1-16/igt@kms_pm_lpsp@kms-lpsp.html
>    [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-12/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-rkl:          [DMESG-WARN][671] ([i915#12964]) -> [SKIP][672] ([i915#15073])
>    [671]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
>    [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-rkl:          [SKIP][673] ([i915#15073]) -> [SKIP][674] ([i915#12916])
>    [673]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
>    [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-rkl:          [SKIP][675] ([i915#15073]) -> [SKIP][676] ([i915#14544] / [i915#15073])
>    [675]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>    [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg1:          [SKIP][677] ([i915#11520] / [i915#4423]) -> [SKIP][678] ([i915#11520])
>    [677]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-dg1-14/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
>    [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-12/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
>     - shard-rkl:          [SKIP][679] ([i915#11520]) -> [SKIP][680] ([i915#11520] / [i915#14544]) +4 other tests skip
>    [679]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-7/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
>    [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
>     - shard-rkl:          [SKIP][681] ([i915#11520] / [i915#14544]) -> [SKIP][682] ([i915#11520]) +4 other tests skip
>    [681]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
>    [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-rkl:          [SKIP][683] ([i915#9683]) -> [SKIP][684] ([i915#14544] / [i915#9683])
>    [683]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-7/igt@kms_psr2_su@page_flip-nv12.html
>    [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-rkl:          [SKIP][685] ([i915#14544] / [i915#9683]) -> [SKIP][686] ([i915#9683])
>    [685]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_psr2_su@page_flip-xrgb8888.html
>    [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-no-drrs:
>     - shard-rkl:          [SKIP][687] ([i915#1072] / [i915#9732]) -> [SKIP][688] ([i915#1072] / [i915#14544] / [i915#9732]) +15 other tests skip
>    [687]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-5/igt@kms_psr@fbc-pr-no-drrs.html
>    [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_psr@fbc-pr-no-drrs.html
> 
>   * igt@kms_psr@fbc-psr-suspend:
>     - shard-dg1:          [SKIP][689] ([i915#1072] / [i915#9732]) -> [SKIP][690] ([i915#1072] / [i915#4423] / [i915#9732])
>    [689]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-dg1-18/igt@kms_psr@fbc-psr-suspend.html
>    [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-dg1-13/igt@kms_psr@fbc-psr-suspend.html
> 
>   * igt@kms_psr@pr-sprite-mmap-gtt:
>     - shard-rkl:          [SKIP][691] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][692] ([i915#1072] / [i915#9732]) +10 other tests skip
>    [691]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_psr@pr-sprite-mmap-gtt.html
>    [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@kms_psr@pr-sprite-mmap-gtt.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>     - shard-rkl:          [SKIP][693] ([i915#5289]) -> [SKIP][694] ([i915#14544])
>    [693]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
>    [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none:
>     - shard-rkl:          [SKIP][695] ([i915#14544]) -> [SKIP][696] ([i915#3555]) +2 other tests skip
>    [695]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-none.html
>    [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-2/igt@kms_scaling_modes@scaling-mode-none.html
> 
>   * igt@kms_vrr@flip-basic-fastset:
>     - shard-rkl:          [SKIP][697] ([i915#14544]) -> [SKIP][698] ([i915#9906])
>    [697]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html
>    [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-5/igt@kms_vrr@flip-basic-fastset.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-rkl:          [SKIP][699] ([i915#3555]) -> [SKIP][700] ([i915#14544]) +1 other test skip
>    [699]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-8/igt@kms_vrr@flip-suspend.html
>    [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-6/igt@kms_vrr@flip-suspend.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - shard-rkl:          [SKIP][701] ([i915#14544] / [i915#3291] / [i915#3708]) -> [SKIP][702] ([i915#3291] / [i915#3708])
>    [701]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@prime_vgem@basic-fence-read.html
>    [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-8/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-rkl:          [SKIP][703] ([i915#14544] / [i915#9917]) -> [SKIP][704] ([i915#9917])
>    [703]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17457/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>    [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/shard-rkl-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   
>   [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
>   [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
>   [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>   [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
>   [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>   [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
>   [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
>   [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>   [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
>   [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
>   [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
>   [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
>   [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
>   [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
>   [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
>   [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
>   [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
>   [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
>   [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
>   [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
>   [i915#12549]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549
>   [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
>   [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
>   [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
>   [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
>   [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
>   [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
>   [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
>   [i915#12916]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12916
>   [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
>   [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
>   [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
>   [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
>   [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
>   [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
>   [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
>   [i915#13328]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13328
>   [i915#13331]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331
>   [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
>   [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
>   [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
>   [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
>   [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
>   [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
>   [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
>   [i915#13729]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13729
>   [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
>   [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
>   [i915#13784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13784
>   [i915#13821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13821
>   [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
>   [i915#14033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033
>   [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
>   [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
>   [i915#14104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14104
>   [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
>   [i915#14121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121
>   [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
>   [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
>   [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
>   [i915#14350]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14350
>   [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
>   [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
>   [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
>   [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
>   [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
>   [i915#14809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14809
>   [i915#15060]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15060
>   [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
>   [i915#15095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095
>   [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
>   [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
>   [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106
>   [i915#15119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15119
>   [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
>   [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
>   [i915#15140]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140
>   [i915#15169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15169
>   [i915#15172]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172
>   [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
>   [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
>   [i915#1850]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1850
>   [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
>   [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
>   [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>   [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
>   [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
>   [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
>   [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
>   [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>   [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
>   [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
>   [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
>   [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
>   [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>   [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
>   [i915#4070]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
>   [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>   [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
>   [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
>   [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
>   [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
>   [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>   [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
>   [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>   [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
>   [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
>   [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>   [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
>   [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
>   [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
>   [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
>   [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
>   [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>   [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
>   [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
>   [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
>   [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
>   [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
>   [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
>   [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
>   [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
>   [i915#6806]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806
>   [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
>   [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
>   [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
>   [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
>   [i915#7294]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294
>   [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
>   [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
>   [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
>   [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>   [i915#8152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152
>   [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>   [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
>   [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
>   [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>   [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
>   [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
>   [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
>   [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>   [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
>   [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
>   [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
>   [i915#8826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826
>   [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
>   [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
>   [i915#9100]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100
>   [i915#9295]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295
>   [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>   [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
>   [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
>   [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
>   [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
>   [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
>   [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
>   [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
>   [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
>   [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
>   [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
>   [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
>   [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8603 -> IGTPW_13967
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_17457: b50629a75c6ecb269adbba8de7b8ab4c9a650641 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_13967: 13967
>   IGT_8603: e6eb3c0fe0f28f3d6e530ae202fbb9f29bde9147 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13967/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
