Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A423C3DA5D
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jul 2024 20:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE2F10E05A;
	Mon, 22 Jul 2024 20:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LAiZXx/m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D1310E166
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jul 2024 20:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721680010; x=1753216010;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=kRdGfaSdqOZcTT29BQJknw2IG8pCOUXY15G5QZE4V3Q=;
 b=LAiZXx/mITssab2e5v6txCAJ6x7cXCe1CkqjK8ne92mqocExjtJ59nnJ
 P+skI3+/y2gZfptn/BdeT7my4L+hvE6fGMbDV8JEz2ibeQx+zHQ+aIQVi
 Jnb4nGYXzDCNbhPfW9kFnfAwj7XPbWXDAMLhqxkgL6sgI8z+3blmC73TN
 Ye951nVged9zqftcZHlyjvQGe+cZ5B4EYUAmU68nFMp/lTiD0S1IufgTz
 88WpJ+OiGG7Io7ig0BoVGshpQMDsc50rGSsA0fsWGBn1azPC16X1Fqx16
 Y45xfDpihkRL30u7nlIwwAMhvlZ8AztXvQ3j2/awcRXsGbwX2OhdY3te+ g==;
X-CSE-ConnectionGUID: lygSJ8jZTbCh/J6653M/QQ==
X-CSE-MsgGUID: XKR3hIkiQya+F/6bwuoMVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="22172582"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="22172582"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 13:26:49 -0700
X-CSE-ConnectionGUID: 02gD1vfQR2GAv3pIMfV4Hw==
X-CSE-MsgGUID: qY/mw4yURo29Q84aEAsVnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="51874303"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jul 2024 13:26:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 13:26:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 13:26:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 22 Jul 2024 13:26:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 13:26:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ww8M0Ip06ZW4ZWnC1a3K8hgx5BeZs8UV1zBf2nhcZnD8/1W6ai0lW024T8blV38AIUg72MkyYtOrSJv4+ccBV4UAAV2BKLVKJeehQUHfPweAYbLt29HdhZhVQbEDTqA0pV4TbFROAPmbhGLzmKgB3DYHsUsf4LNHwn+yFWwa4UZBxJGKjzfPGx+bc3egd1LBmF0ZvWlVj6WD56IiHWuO5vpk1hEylTSjqLgn65RkLIMf907HM0lJ2eZbqK2bpu6UHLznh3C/EZzVdsChCdu3sCuDBroc0JWnghTbhN46KU5TVGkZLk/lRafWdPEEmhVSTMhO/8NRzl8erEH1qS4EgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRoP2318Ah9Ah+GDiHOY2EvFvoTp6EHBsUEeDzgcJbc=;
 b=MAz41dHjsC40OIgyCLl2SutN75EKzmW4+/sYZXtdUIU7VZiR8JTJrf+VtVgsek811HFrK/eGM2UDpchWZWbIqBijoCP4EHVgIAp+foTavPPeqdr2fHUFD0cVwegF7Vz0SJZpjnCBi7kovjQ95PLeguHg4MJaPl7D8VVFnBH7qwUOWOsLJGx1vCtTawcyzPun8VSiX2WD9GfOWNpNbP5tVmjmqiw9exPz3FAMvSthPJmta6vJkoyripK2zSUfsvTsuw0ZAl4SHJzo8S7IEZ+HcphDjI2Cl4QV7CaHauI+GSOv9eH2pYLDbkkeXGL9Ee1azwSdkWrK5qtPMwmzOjYPOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN2PR11MB4694.namprd11.prod.outlook.com (2603:10b6:208:266::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Mon, 22 Jul
 2024 20:26:26 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7784.017; Mon, 22 Jul 2024
 20:26:26 +0000
Date: Mon, 22 Jul 2024 13:26:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIENJLnhlQkFUOiBzdWNjZXNz?=
 =?utf-8?Q?_for_tests=2Fxe=5Fquery?= =?utf-8?Q?=3A?= Also allow IP version
 less than 20 for BMG media
Message-ID: <20240722202623.GP2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240722183511.1934050-1-matthew.d.roper@intel.com>
 <172167573909.342828.10259959301334194779@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172167573909.342828.10259959301334194779@2413ebb6fbb6>
X-ClientProxiedBy: SJ0PR03CA0184.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN2PR11MB4694:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c89108-3287-4b7e-4ea2-08dcaa8c8fd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Agm5IkIGIslEwOiFYQJMvEIYwYBt9poiI1tnvHt1wjXHRXMSYVEKc06W61qE?=
 =?us-ascii?Q?5DxPDo4qcjQlSD0eWu1CHhEsGzJYGuwhOjEF/jt87F8YeAlvca/tjcFjiQWW?=
 =?us-ascii?Q?ZHBOrbW3IIvk/yIe1FFmKcyq5w02GtETJeJgRjKmlgH4uVEUCM/+G5+2WdZd?=
 =?us-ascii?Q?xyRbj7SWgc8hgV3IteStagnYJS+HaPmd4kYOzcIAwhAEporVC3k7JcSflBJL?=
 =?us-ascii?Q?FC9ez0dLPDGIjSrEwOgLAVr3J3Lun7PNKCeGGLv8n5JcamQwzmJqY7JySAGr?=
 =?us-ascii?Q?ESkWVlAS+n5irG3AwS5Fs/zxucpyfPK/LOVlXh+xeo6e1wiZE+zwamEQd1iu?=
 =?us-ascii?Q?g59w1VqJkR1LfnzcopJghF5Uun5/XhR4YdQJYRfxzMZdncOWF2vBKNVXw+zr?=
 =?us-ascii?Q?L1aq461VcDPDuRgjdhjGtevKKSED9mxGr6rhOnQcESD70TEWiIXrIV7byM3G?=
 =?us-ascii?Q?+x29jJJRPmriWr0ttOS5/ljglCJ+rXYe5g+yg3GVfXU1sUBjZ9uUG0qs8y45?=
 =?us-ascii?Q?4lv80E4GD/9YTozG1+dUoIboPV5CGJ+KL7vNkagz1u0QgNQExlfIDO+scLGu?=
 =?us-ascii?Q?lBZA0XoLurtyp4gItFEOygs8rtRyaCPL8COuY5IOB/qAGPVsbwgMS0r3Ibp3?=
 =?us-ascii?Q?Q/s5yIWpK394qwrdUyqBZwk/pMHLQ1jNB0k4G6BVvaCNEgkceKYHH0UsFYjf?=
 =?us-ascii?Q?L+kVGWLrlIu8HJdUI4LTvAxpNhHN9h2rAZfnQq4t0bEBGvIHBeap/peh2/lH?=
 =?us-ascii?Q?LdtViFmnjbsq3L/cccap9FA17qhxb/zmhNhR3/AQr8+fytv2AArKahDDYDN1?=
 =?us-ascii?Q?mp7c2hgknIEcEPDYLAN1qVypcE/MURaE6PMWxfe3uyhe1htX9K1w6/DINUCY?=
 =?us-ascii?Q?lGU40SD4Z70U1bhBV7VMEvZ3iHokbjIZApO0qOlzQ65rCvS0bCGdBj5UnQw2?=
 =?us-ascii?Q?MpLG6fXeM0hzxtnlE00F3ok4Y59ake//GFmEizOrRhFaHWSCVGmJX/543k6d?=
 =?us-ascii?Q?18XhVEuhjvUo3iSTYwWVXXdRXUESR7fYnM9TDIbUcmtD2+PJ1l74XT4w3W0e?=
 =?us-ascii?Q?WPhWV8rFsU0+RfnJN26W86vBwpvf+Hbwqf/vey1NUA32WkxuaM2nOtjPTFXa?=
 =?us-ascii?Q?H3nUqCjPNkmXV/XB1wEcZo3BSE60JlgwPt+xMLmGve0+euW1wSLIWU3IHJpW?=
 =?us-ascii?Q?rGE0sKBp9OQ+KPqBbWhjAHtFgXoF/5F/L1j2i/C1AFTx1t1xNaecx6A7/gAN?=
 =?us-ascii?Q?qw3AZPQP/YMvp7Qa2BgG3NdFMbNZK5/PG867MHz4w/haTFwxYmtFEhjlWG9u?=
 =?us-ascii?Q?zME=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KcSlfVcIk0Nlgx3OsiXU9Sbps1sUDsIeRvF0uhXfV+CI7VhVwiRsCKbRrZTw?=
 =?us-ascii?Q?nFxz7xuzyWk14nnifgrEad63l897brKXrwJun7nxtchWExjH1ZyqNrLNnAcL?=
 =?us-ascii?Q?PqNPMDlGJ1EEthbQuUdAXNV3pUKVpxGJwMlpHgNbIuVcr+i8HcgZF0ur2+Gc?=
 =?us-ascii?Q?nafex5y00Fbe5UKEefSsu+YIRn93namMTV0QJK5dOu/chw2kDOuNCKJb5Ssm?=
 =?us-ascii?Q?SV0s13dcYY37ApcAB+HNBnH9eHV7ISRhLI1loUKweeoybPuH9yLCvcXOAK2Y?=
 =?us-ascii?Q?QvVlUT/tJ17a/wp441CfW0Y37b40ciDvmnx99tYUF8eZY45Hb+IzaZwOZ3Lb?=
 =?us-ascii?Q?xVMMS27Y1q9dPgLW6n0ijG2CvPUaOJrSnUqBNFABrfrgiFDAaKFguPE3mEPg?=
 =?us-ascii?Q?2kTRREVIXMR/ENYKd65zvZrNfNoGq+eXXC1FCjOIeWwcxDLNnGWTh09WfnfO?=
 =?us-ascii?Q?43QVY8kPk7uE7taIQtkbhWZoSy3o18cCfIe2syyJzxGuimr0Ivn8sht9wZwh?=
 =?us-ascii?Q?4g1gt0It36tJ5jD3ATiE8Y7G2qJyKZ9p1u1RhSFCMhwVxeAcy89syaGKDkkK?=
 =?us-ascii?Q?yGASpYzU0WLi8fejm1GXsXqorpEUzKNuKIps1UVR3y6JUBFP//jdYq/aY+uc?=
 =?us-ascii?Q?IJackXpVPShUF7ROs5QhusMyyTNvseH+/obYZR5kk5UERDLLafOs7lIe7Yuw?=
 =?us-ascii?Q?RyXSlI8njuOc99bKGNQWhrNUUryaZcoQEmxBH5lfzgoJKqeBfnTzDmWCCSrv?=
 =?us-ascii?Q?vsjuqoQuMimzn6stzFa/EGxhoHhePWRONo4XGUueHPY8sb30AzRxte256+OP?=
 =?us-ascii?Q?KjhFzZh125+1DylWVf9t00J3srmthn+cL8oZLq1T8OYVEmOAoxw9NxRuiv6p?=
 =?us-ascii?Q?vKFFo45PTBvzR9o9K81hOJS+ukr8Q0CAdS7X3YISczExceKQsyEYBT5Yxvby?=
 =?us-ascii?Q?Dgmrw34jQLh3IiBYVV3N2qHbxdUkcD0hA7erVFDbNSYL9qvV0k9b6YzWCQnT?=
 =?us-ascii?Q?iP0BvryxzxIebb+dn81kv6Ej/blAVeJ60e3lUXP5cukM72f7MZwifQYlrWvf?=
 =?us-ascii?Q?28/prKgHLZp9fX9/0I9xZxOC+76FEAkalFelYtQ0yhJM3eZzkdV3d9M4zoqv?=
 =?us-ascii?Q?RUZRxxdZF7gnsnDvE5DAV6oUczMSSDq9XGdtObdaC3kVmfyrd8dxK+XXdCsY?=
 =?us-ascii?Q?oFnLJl1phw11b7gimYgPR13I/edJLdsP6W9ca7SDMjBMT243ubPehifO+14/?=
 =?us-ascii?Q?tJZajDeugrbTtQwUP70/Sglw6aETOwb9nmqzdVGAfOJrMen1KaZw0Rw4FNCG?=
 =?us-ascii?Q?9hQkpnPKaMwFFrpV6N9J4FRe99xNCTFSONxd6tof7OxkZlnRui9qlA2zdPAg?=
 =?us-ascii?Q?uT+0iwxjt1UdsUYbRyD77BE2O/pQ8bH7T/rDwHzeZEpsuvc6EyZsVaFG2ynR?=
 =?us-ascii?Q?nfrVPKHObOyiRhaN12BLskNTmbg2XRsRNE5UlAB4Ypy7frbfn89RmqtQDw/r?=
 =?us-ascii?Q?ftcRmTVeiRYo652hitXVfsg9dlMFwxqMnW3/X7J3dIeBDXzIW+yvVi15lbYX?=
 =?us-ascii?Q?Umo9XAPEHhSafPS0fTuIeVBuex4s2cwvnFCgqbnvq87VSM3RHJ1mtALB5xK2?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c89108-3287-4b7e-4ea2-08dcaa8c8fd3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 20:26:26.5687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eyyu6jgY5r/KKA1uv0iFMgGlW4yDq9ZzDpLtMeEJLARRy/WkfpdDHqmqDeNJfDKISJDdu6PXg3tTdy6uxHcEzrVSFLMByDPjBg7390HkWLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4694
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

On Mon, Jul 22, 2024 at 07:15:39PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/xe_query: Also allow IP version less than 20 for BMG media
> URL   : https://patchwork.freedesktop.org/series/136349/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7933_BAT -> XEIGTPW_11442_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   
> 
> Participating hosts (7 -> 7)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11442_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@xe_live_ktest@xe_bo:
>     - bat-adlp-7:         [PASS][1] -> [SKIP][2] ([Intel XE#455])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11442/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>     - bat-adlp-7:         [PASS][3] -> [SKIP][4] ([Intel XE#2229] / [Intel XE#455])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11442/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>     - bat-lnl-1:          [PASS][5] -> [SKIP][6] ([Intel XE#2229])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11442/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - bat-pvc-2:          [PASS][7] -> [SKIP][8] ([Intel XE#2229])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/bat-pvc-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11442/bat-pvc-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>     - bat-adlp-7:         [PASS][9] -> [SKIP][10] ([Intel XE#2229])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11442/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@xe_gt_freq@freq_fixed_idle:
>     - bat-adlp-7:         [FAIL][11] ([Intel XE#2262]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/bat-adlp-7/igt@xe_gt_freq@freq_fixed_idle.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11442/bat-adlp-7/igt@xe_gt_freq@freq_fixed_idle.html
> 
>   * igt@xe_query@query-gt-list:
>     - {bat-bmg-1}:        [FAIL][13] ([Intel XE#2238]) -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/bat-bmg-1/igt@xe_query@query-gt-list.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11442/bat-bmg-1/igt@xe_query@query-gt-list.html

Fixes #2238 as expected.

Applied to master.  Thanks for the reviews.


Matt

> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2238
>   [Intel XE#2262]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7933 -> IGTPW_11442
>   * Linux: xe-1633-25cbb0b9828d08006be65c72f2ad5e85766d1941 -> xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0
> 
>   IGTPW_11442: 11442
>   IGT_7933: 7933
>   xe-1633-25cbb0b9828d08006be65c72f2ad5e85766d1941: 25cbb0b9828d08006be65c72f2ad5e85766d1941
>   xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0: ea064de9c72e649eca5659c6ef24019faa7019b0
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11442/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
